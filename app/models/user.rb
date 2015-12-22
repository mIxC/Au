class User < ActiveRecord::Base

  validates_uniqueness_of :user_name
  validates_presence_of :user_name, length: 3..11
  validates_presence_of :password_digest, length: 6..20

  has_many :as_first_user, class_name: "Room"
  has_many :as_second_user, class_name: "Room"
  has_secure_password

  def mmr
    self.wins * 3
  end


#-----------------------------------------------------------------
  #------------check online user, DON'T USE THIS------------------

  ONLINE_PERIOD = 5.minutes

  scope :online, -> { where('updated_at > ?', ONLINE_PERIOD.ago) }

  def online?
    updated_at > ONLINE_PERIOD.ago
  end

end

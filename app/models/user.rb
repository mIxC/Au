class User < ActiveRecord::Base



  validates_uniqueness_of :user_name
  validates_presence_of :user_name ###, length: 3..11
  validates_presence_of :password_digest ####, length: 6..20


  has_many :as_first_user, class_name: "Room"
  has_many :as_second_user, class_name: "Room"
  has_secure_password



  def mmr
    500 + (24 * self.wins) + ( - (25 * self.loss)) + (self.draw)
  end



  ONLINE_PERIOD = 5.minutes

  scope :online, -> { where('updated_at > ?', ONLINE_PERIOD.ago) }

  def online?
    updated_at > ONLINE_PERIOD.ago
  end

end

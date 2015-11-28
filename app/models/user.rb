class User < ActiveRecord::Base

  validates_uniqueness_of :user_name
  validates_presence_of :user_name, :password_digest



  has_secure_password

end

class User < ActiveRecord::Base
  has_many :trips, dependent: :destroy
  has_many :managers, through: :trips
  # turn email value to lower case
  before_save { self.email = email.downcase }
  validates :username, presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: { minimum: 5, maximum: 25  }
  # email format validation          
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
            
  validates :email, presence: true, 
            length: { maximum: 55 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end 
class User < ApplicationRecord

  def self.authenticate_with_credentials(email, password)
    !email ? nil : email_no_space_lower = email.strip.downcase

    user = User.find_by_email(email_no_space_lower)
    
    user && user.authenticate(password) ? user : nil
  end

  has_secure_password

  validates :password, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: {case_sensitive: false} 

  before_save do 
    self.email = self.email.strip.downcase  
  end
end
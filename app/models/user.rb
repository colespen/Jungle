class User < ApplicationRecord

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user 
    else
      nil
    end
  end

  has_secure_password

  validates :password, length: { minimum: 8 }
  validates :email, uniqueness: true
end
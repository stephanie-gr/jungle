class User < ActiveRecord::Base

  has_secure_password

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 8 }
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  def authenticate_with_credentials(email, password) 

    user_email = email.strip
    user = User.find_by(email: user_email.downcase)

    if user && user.authenticate(password)
      return user
    else 
      return nil
    end

  end
end


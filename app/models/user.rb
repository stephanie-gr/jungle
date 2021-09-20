class User < ActiveRecord::Base

  has_secure_password

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 8 }
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  def authenticate_with_credentials(email, password) 

    user = User.find_by_email(email)

    if user && user.authenticate(password)
      return user
    else 
      return nil
    end

  end
end


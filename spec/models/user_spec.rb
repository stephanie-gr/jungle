require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "is valid with valid attributes" do
      user = User.new

      user.name = "Mo Salah"
      user.email = "msalah@gmail.com"
      user.password = "123ImTheBest"
      user.password_confirmation = "123ImTheBest"
      expect(user).to be_valid
    end

    it "is not valid with a name" do
      user = User.new

      user.name = nil
      user.email = "msalah@gmail.com"
      user.password = "123ImTheBest"
      user.password_confirmation = "123ImTheBest"
      expect(user).to_not be_valid
    end

    it "is not valid without an email" do
      user = User.new

      user.name = "Mo Salah"
      user.email = nil
      user.password = "123ImTheBest"
      user.password_confirmation = "123ImTheBest"
      expect(user).to_not be_valid
    end

    it "is not valid without a unique email" do
      user = User.new
      
      user.name = "Mo Salah"
      user.email = "msalah@gmail.com"
      user.password = "123ImTheBest"
      user.password_confirmation = "123ImTheBest"
      expect(user).to be_valid

      user.save
      
      user2 = User.new

      user2.name = "Mo Salah"
      user2.email = "msalah@gmail.com"
      user2.password = "123ImTheBest"
      user2.password_confirmation = "123ImTheBest"
      expect(user2).to_not be_valid
    end

    it "is not valid without a password and matching password confirmation " do
      user = User.new

      user.name = "Mo Salah"
      user.email = "msalah@gmail.com"
      user.password = "123ImTheBess"
      user.password_confirmation = "123ImTheBest"
      expect(user).to_not be_valid
    end

    it "is not valid without a password of at least 8 characters" do
      user = User.new

      user.name = "Mo Salah"
      user.email = "msalah@gmail.com"
      user.password = "123"
      user.password_confirmation = "123"
      expect(user).to_not be_valid
    end
  
  end

  describe '.authenticate_with_credentials' do
    
    it 'signs the user in if they have valid credentials' do
      user = User.new

      user.name = "Mo Salah"
      user.email = "msalah@gmail.com"
      user.password = "123ImTheBest"
      user.password_confirmation = "123ImTheBest"

      user.save

      expect(user.authenticate_with_credentials(user.email, user.password)).to eq(user)
    end

    it 'signs the user in if they haave valid credentials AND typed their email with trailing or leading whitespace' do
      user = User.new

      user.name = "Beyonce Knowles"
      user.email = "destinyschild@gmail.com"
      user.password = "beyonce123"
      user.password_confirmation = "beyonce123"

      user.save

      expect(user.authenticate_with_credentials('     destinyschild@gmail.com', user.password)).to eq(user)
    end

    it 'signs the user in if they have valid credentials AND typed their email in the wrong case' do
      user = User.new

      user.name = "Beyonce Knowles"
      user.email = "        destinyschild@gmail.com"
      user.password = "beyonce123"
      user.password_confirmation = "beyonce123"

      user.save

      expect(user.authenticate_with_credentials(user.email, user.password)).to eq(user)
    end

  end
end

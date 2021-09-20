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
  
  end
end

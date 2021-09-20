require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "is valid with valid attributes" do
      product = Product.new
      category = Category.new

      category.name = "Clothing"
      category.id = 4

      product.name = "Anything"
      product.price_cents = 50000000
      product.quantity = 1
      product.category_id = category.id
      product.category = category
      expect(product).to be_valid
    end
  
  end
end

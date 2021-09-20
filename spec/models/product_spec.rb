require 'rails_helper'

RSpec.describe Product, type: :model do

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


    it "is not valid without a name" do
      product = Product.new
      category = Category.new

      category.name = "Clothing"
      category.id = 4

      product.name = nil
      product.price_cents = 50000000
      product.quantity = 1
      product.category_id = category.id
      product.category = category
      expect(product).to_not be_valid
      expect(product.errors.full_messages)
    end

    it "is not valid without a price" do
      product = Product.new
      category = Category.new

      category.name = "Clothing"
      category.id = 4

      product.name = "Hazelnut"
      product.price_cents = nil
      product.quantity = 1
      product.category_id = category.id
      product.category = category
      expect(product).to_not be_valid
      expect(product.errors.full_messages)
    end

    it "is not valid without a quantity"
    it "is not valid without a category"


  end
end

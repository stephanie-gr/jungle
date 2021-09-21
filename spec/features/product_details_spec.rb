require 'rails_helper'

RSpec.feature "Visitor navigates to product details", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end
  end

  scenario "They see all product details" do
    # ACT
    visit root_path

    click_link 'Details'


    
    expect(page).to have_content 'Description'
    expect(page).to have_content 'Quantity'
    
    # DEBUG / VERIFY
    save_screenshot
  end

end
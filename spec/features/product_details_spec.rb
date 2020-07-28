require 'rails_helper'

RSpec.feature "Users can navigate from the home page to the product detail page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'Users can go to the product detail page by clicking the detail button' do
    visit root_path
    
    first('.product').click_link('Details')

    # save_screenshot('product_details.png')
    expect(page).to have_text 'Quantity'
  end

end

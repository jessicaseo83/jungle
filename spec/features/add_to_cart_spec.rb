require 'rails_helper'

RSpec.feature 'Add to Cart button', type: :feature, js: true do
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

  scenario 'users can click the "Add to Cart" button for a product on the home page and in doing so their cart increases by one' do
    visit root_path

    first('.product').click_button('Add')

    save_screenshot('add_to_cart.png')

    expect(page).to have_text 'My Cart (1)'
  end

end

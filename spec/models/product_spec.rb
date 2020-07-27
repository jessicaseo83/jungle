require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'expects invalid if name is missing' do
      @category = Category.new(name: "Pets")
      @product = Product.new(name: nil, price_cents: 770, quantity: 300, category: @category)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'expects invalid if price is missing' do
      @category = Category.new(name: "Apparel")
      @product = Product.new(name: "Cool Looking Shorts", price_cents: nil, quantity: 90, category: @category)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'expects invalid if quantity is missing' do
      @category = Category.new(name: "Home")
      @product = Product.new(name: "Lion Statue", price_cents: 43290, quantity: nil, category: @category)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'expects invalid if category is missing' do
      @category = Category.new(name: "Electronics")
      @product = Product.new(name: "Pear's new ophone", price_cents: 234890, quantity: 330, category: nil)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it 'expects valid if name, price, quantity and category are provided' do
      @category = Category.new(name: "Books")
      @product = Product.new(name: "A letter from an alien", price_cents: 1000, quantity: 2, category: @category)
      expect(@product).to be_valid
      expect(@product.errors.full_messages.length).to eq(0)
    end

  end

    

end

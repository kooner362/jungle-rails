require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    @category = Category.new(
      id: 12,
      name: 'Stationary'
    )

    @product = Product.new(
      name: 'Pencil',
      price_cents: 200,
      quantity: 10,
      category: @category
    )
  end

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @product.category = nil
      expect(@product).to_not be_valid
    end
  end
end

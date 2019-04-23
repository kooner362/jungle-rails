require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "View product details" do
    # ACT
    visit root_path
    within 'footer' do
      click_on 'Details »'
    end
    sleep 5
    # DEBUG / VERIFY
    # save_screenshot

    expect(page).to have_content 'Reviews'
  end
end

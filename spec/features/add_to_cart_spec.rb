require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "View cart quantity update" do
    # ACT
    visit root_path
    within 'footer' do
      click_button 'Add'
    end
    sleep 5
    # DEBUG / VERIFY
    # save_screenshot

    expect(page).to have_content 'My Cart (1)'
  end
end

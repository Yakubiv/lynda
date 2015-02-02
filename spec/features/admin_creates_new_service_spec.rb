require 'spec_helper'

feature 'Admin can create new service' do
  background do
    sign_in_with 'petro.yakubiv@gmail.com', 'password'
  end
  scenario 'with correct data' do
    click_link 'service'
    expect(page).to have_content('New Service')
    fill_in 'Service name', with: 'Nails'
    fill_in 'Price', with: '100'
    click_on 'Done'
    expect(page).to have_content('Services')
  end

  def sign_in_with(email, password)
	admin = FactoryGirl.create(:admin)
	visit root_path
	fill_in 'Email', with: admin.email
	fill_in 'Password', with: admin.password
	click_on 'Log in'
	expect(page).to have_content("BeautySpa")
  end
end

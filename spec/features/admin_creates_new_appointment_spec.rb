require 'spec_helper'

feature 'Admin can create new appointment' do
  background do
    sign_in_with 'petro.yakubiv@gmail.com', 'password'
  end
  scenario 'with new customer' do
    click_link 'appointment'
    expect(page).to have_content('New appointment')
    find("#true").click
    expect(page).to have_content('First Name')
    fill_in 'First Name', with: 'Petro'
    fill_in 'Last Name', with: 'Yakubiv'
    fill_in 'Phone', with: '666'
    find(:css, "#appointment_service_ids_9[value='9']").set(true)
    fill_in 'Set appointment date', with: '01/02/2015 12:07 PM'
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

require 'spec_helper'
require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  feature 'the signup process' do
    scenario 'has a new user page'
    visit new_user_url
    expect(page).to have_content("Submit")

    feature 'signing up a user' do
      visit new_user_url

    scenario 'shows username on the homepage after signup'
      fill_in "Password", with: "password"
      fill_in "Username", with: "papabear"
      click_button "Submit"
      expect(current_path).to eq(user.path(User.last))
      expect(page).to have_content(input_user.username) 
    end
  end

  feature 'logging in' do
    scenario 'shows username on the homepage after login'

  end

  feature 'logging out' do
    scenario 'begins with a logged out state'

    scenario 'doesn\'t show username on the homepage after logout'

  end
end
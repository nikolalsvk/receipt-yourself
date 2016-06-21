require 'spec_helper'

feature 'Authentication', js: true do
  before do
    @user = FactoryGirl.create(:confirmed_user)

    visit '/sign_in'
  end

  feature 'login' do
    scenario 'with invalid credentials' do
      login("lol@lol.com", "testtest")

      expect(page).to have_content('Invalid credentials')
    end

    scenario 'redirect after login' do
      login(@user.email, @user.password)

      expect(page).to have_content('You are signed in as')
    end
  end

  def login(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    find("button", text: "SIGN IN").click
  end
end

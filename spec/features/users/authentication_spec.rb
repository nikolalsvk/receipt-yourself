require 'spec_helper'

feature 'Authentication', js: true do
  before do
    @user = FactoryGirl.create(:confirmed_user)

    visit '/'  
  end

  feature 'login' do
    before do
      visit '/sign_in'
    end
    scenario 'redirect after login' do
      login(@user.email, @user.password)

      expect(page).to have_content('You are signed in as')
    end
    scenario 'with invalid credentials' do
      login("lol@lol.com", "testtest")

      expect(page).to have_content('Invalid credentials')
    end
  end

  feature 'frontpage-login' do
    before do
      visit '/'
    end
    scenario 'redirect after login' do
      login(@user.email, @user.password)

      expect(page).to have_content('You are signed in as')
    end
    scenario 'with invalid credentials' do
      login("lol@lol.com", "testtest")

      expect(page).to have_content('Invalid credentials')
    end
  end

  def login(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    find("button", text: "SIGN IN").click
  end

end

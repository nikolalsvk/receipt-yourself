require 'spec_helper'

feature "Registration", js: true do
  scenario "with valid inputs" do
    visit "/sign_up"

    email, password = "test@joe.com", "iamtestpassword"
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_on "Sign up"

    visit '/sign_in'
    login(email, password)

    expect(page).to have_content('SIGN OUT')
  end

  def login(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    find("button", text: "SIGN IN").click
  end
end

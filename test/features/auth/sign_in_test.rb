require "test_helper"

feature "As a site visitor I want to sign in so that I can access my account" do
  scenario "signing in" do
    visit root_path
    click_on "Sign In"

    fill_in "Email", with:  users(:Joe).email
    fill_in "Password", with: users(:Joe).encrypted_password

    page.must_have_content "Sign In"
    page.wont_have_content "Sign Out"
  end
end

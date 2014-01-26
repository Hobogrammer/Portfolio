require "test_helper"

feature "As a site visitor I want to sign in so that I can access my account" do
  scenario "signing in" do
    visit root_path
    click_on "Sign In"

    fill_in "Email", with:  users(:Joe).email
    fill_in "Password", with:  "password"

    click_on "Sign in"

    page.must_have_content "Sign Out"
    page.wont_have_content "Sign In"

  end
end

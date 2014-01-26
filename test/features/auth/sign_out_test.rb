require "test_helper"

feature "As a site visitor I want to be able to sign out so that I can protect my account data" do
  scenario "signing out" do
    visit root_path

    click_on "Sign In"

    fill_in "Email", with:  users(:Joe).email
    fill_in "Password", with: "password"

    click_on "Sign in"

    click_on "Sign Out"

    page.must_have_content "Sign In"
    page.wont_have_content "Sign Out"
  end
end

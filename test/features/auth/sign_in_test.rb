require "test_helper"

feature "As a site visitor I want to sign in so that I can access my account" do
  scenario "signing in" do
    sign_in
    visit root_path

    page.must_have_content "Sign Out"
    page.wont_have_content "Sign In"
  end
end

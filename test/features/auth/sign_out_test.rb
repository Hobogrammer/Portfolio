require "test_helper"

feature "As a site visitor I want to be able to sign out so that I can protect my account data" do
  scenario "signing out" do

    sign_in

    visit root_path

    click_on "Sign Out"

    page.must_have_content "Sign In"
    page.wont_have_content "Sign Out"
  end
end

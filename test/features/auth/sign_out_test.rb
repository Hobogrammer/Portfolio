require "test_helper"

feature "As a site visitor I want to be able to sign out so that I can protect my account data" do
  scenario "signing out" do
    Skip
    #Given that user is logged in
    visit root_path

    click_on "Sign In"


    #When the sign out button is pressed

    #Then the user should no longer be signed in
    page.must_have_content "Sign In"
    page.wont_have_content "Sign Out"
  end
end

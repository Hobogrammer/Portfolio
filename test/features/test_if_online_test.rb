require "test_helper"

feature "Test If Online" do
  scenario "visting the address of the application " do

    visit "http://hobogrammerportfolio.heroku.com"

    page.text.must_include "Welcome to My Blog"
  end
end

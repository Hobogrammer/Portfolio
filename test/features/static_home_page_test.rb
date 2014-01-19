require "test_helper"

feature "Static Home Page" do
  scenario "visit the home page" do
    visit "/"
    page.must_have_content "Welcome to My Blog"
  end
end

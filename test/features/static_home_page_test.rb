require "test_helper"

feature "StaticHomePage" do
  scenario "the test is sound" do
    visit "/"
    page.must_have_content "Welcome aboard"
    page.wont_have_content "Goobye All!"
  end
end

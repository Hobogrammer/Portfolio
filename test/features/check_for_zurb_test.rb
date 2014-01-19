require "test_helper"

feature "Check For Zurb" do
  scenario "visiting index" do
    skip #no longer valid test
    visit root_path

    page.must_have_css(".columns")
  end
end

require "test_helper"

feature "Check For Zurb" do
  scenario "visiting index" do
    visit root_path

    page.must_have_css("columns")
  end
end

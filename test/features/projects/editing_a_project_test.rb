require "test_helper"

feature "Editing A Project" do
  scenario "edit a previous project" do
    project = projects(:portfolio)
    visit edit_project_path(project)

    fill_in "Name", :with => "Awesome Portfolio"

    click_on "Update Project"

    page.must_have_content "Awesome Portfolio"
    page.must_have_content "success"
    page.wont_have_content "How meta"
  end

  scenario "incorrectly editing an existing project" do
    visit edit_project_path(projects(:portfolio))

    fill_in "Name", :with => "Q"
    fill_in "Technologies used", :with => ""

    click_on "Update Project"

    page.must_have_content "prohibited"
    page.must_have_content "Name is too short"
    page.wont_have_content "success"
  end
end

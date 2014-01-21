require "test_helper"

feature "Creating A Project" do
  scenario "making a new project" do
    visit projects_path

    click_on "New Project"

    fill_in 'Name', :with => 'Code Fellows Portfolio'
    fill_in 'Technologies used', :with => "Rails, Ruby, Zurb"

    click_on 'Create Project'

    page.text.must_include "Project has been created"
    page.text.must_include "Code Fellows Portfolio"
  end

  scenario "new project has invalid data" do
    #Give invalid project data is entered in a form
    visit new_project_path
    fill_in "Name", with: "Q"
    #When the form is summited with a short name and missing technologies_used field
    click_on "Create Project"
    #Then the form should be displayed again with an error message
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end

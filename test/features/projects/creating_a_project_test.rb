require "test_helper"

feature "Creating A Project" do
  scenario "making a new project" do
    visit projects_path

    click_on "New Project"

    fill_in 'Title', :with => 'Code Fellows Portfolio'
    fill_in 'Technologies used', :with => "Rails, Ruby, Zurb,"

    click_on 'Create Project'

    page.text.must_include "Project has been created"
    page.text.must_include "Test Project"
  end
end

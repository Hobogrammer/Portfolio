require "test_helper"

feature "Deleting A Project" do
  scenario "removing a project" do
    project = Project.create!(name: "Delete This Project", technologies_used: "Ruby, Rails, Javascript")
    visit projects_path

    page.find("a[href='/projects/#{project.id}'][data-method='delete']").click

    page.wont_have_content "Delete This Project"
    page.must_have_content "Project deleted"
  end
end

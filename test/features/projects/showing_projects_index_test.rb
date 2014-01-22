require "test_helper"

feature "Showing Projects Index" do
  scenario "viewing all projects" do
    visit projects_path

    page.must_have_content projects(:portfolio).name
    page.must_have_content projects(:portfolio).technologies_used
    page.must_have_content projects(:freelance).name
    page.must_have_content projects(:freelance).technologies_used
  end
end

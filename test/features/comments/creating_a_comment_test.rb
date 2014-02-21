require "test_helper"

feature "comments new" do
  scenario "creating a comment as an unregisterd vistor" do
    visit post_path(posts(:cr))

    page.wont_have_button "Create Comment"
  end

  scenario "creating a comment on a post as a signed in user" do
    sign_in(:user)
    visit post_path(posts(:cr))

    fill_in "Content", with: "bLAH BLAH BLAH"

    click_on "Create Comment"

    page.must_have_content "bLAH BLAH BLAH"
  end

  scenario "creating a comment on a project as a signed in user" do
    sign_in(:user)
    visit project_path(projects(:portfolio))

    fill_in "Content", with: "Sweet project, much technologies"

    click_on "Create Comment"

    page.must_have_content "Sweet project, much technologies"
  end
end

require "test_helper"

feature "comments new" do
  scenario "creating a comment as random site user" do
    visit post_path

    fill_in "Content", with: "bLAH BLAH BLAH"

    click_on "Create Comment"

    page.must_have_content "bLAH BLAH BLAH"
  end
end

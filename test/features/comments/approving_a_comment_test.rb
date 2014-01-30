require "test_helper"

feature "updating comment approved status" do
  scenario "editor approving comments" do
    sign_in(:editor)

    visit  post_path(posts(:cr))

    click_on "Approve"

    page.must_have_content "Status: Approved"
  end
end

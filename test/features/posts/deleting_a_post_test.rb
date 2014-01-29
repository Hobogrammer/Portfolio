require "test_helper"

feature "Deleting A Post" do
  scenario "post is deleted with a click as an editor" do

    sign_in(:editor)
    visit posts_path

    title = posts(:cr).title
    body = posts(:cr).body

    first(:link, 'Destroy').click

    page.wont_have_content(title)
    page.wont_have_content(body)
  end

  scenario "authors cannot delete" do
    sign_in(:author)

    visit posts_path

    page.wont_have_link "Destroy"
  end
end

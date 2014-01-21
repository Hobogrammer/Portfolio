require "test_helper"

feature "Deleting A Post" do
  scenario "post is deleted with a click" do

    visit posts_path

    title = posts(:cr).title
    body = posts(:cr).body

    first(:link, 'Destroy').click

    page.wont_have_content(title)
    page.wont_have_content(body)
  end
end

require "test_helper"

feature "Deleteing A Post" do
  scenario "post is deleted with a click" do

    post = Post.create(title: "Foobar", body: "Foobaz")

    visit show_post_path(post)

    click_on('delete')

    page.wont_have_content "Foobar"
    page.wont_have_content "Foobaz"
  end
end

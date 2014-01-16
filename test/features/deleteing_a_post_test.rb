require "test_helper"

feature "Deleteing A Post" do
  scenario "post is deleted with a click" do

    post = Post.create(title: "Foobar", body: "Foobaz")

    visit posts_path

    click_on('Destroy')

    page.wont_have_content "Foobar"
    page.wont_have_content "Foobaz"
  end
end

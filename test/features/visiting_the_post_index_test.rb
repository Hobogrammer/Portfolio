require "test_helper"

feature "Visiting The Post Index" do
  scenario "with existing posts,show list" do
    post = Post.create!(title: "Hello World", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a libero justo.")
    visit post_path(post)
    page.must_have_content "Hello World"
    page.must_have_content "Lorem"
  end
end

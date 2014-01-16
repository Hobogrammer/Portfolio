require "test_helper"

feature "Visiting The Post Index" do
  scenario "with existing posts,show list" do
    post = Posts.create!(title: "Hello World", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a libero justo.")
    visit posts_path
    page.must_have_content "Hello World"
    page.must_have_content "Lorem"
  end
end

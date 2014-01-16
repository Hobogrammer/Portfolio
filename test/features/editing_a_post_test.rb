require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to an existing post" do

    post  = Posts.create!(title: "Foobar", body: "Foobaz")

    visit post_path(post)
    click_on('edit')

    fill_in('title', :with => "Newbar")
    fill_in('body', :with => "Oldfoo")

    click_on("Submit")

    page.should have_content("Newbar")
    page.should have_content("Oldfoo")
  end
end

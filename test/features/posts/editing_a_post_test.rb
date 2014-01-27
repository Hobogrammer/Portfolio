require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to an existing post" do

    sign_in

    visit post_path(posts(:cr))
    click_link('Edit')

    fill_in('Title', :with => "Newbar")
    fill_in('Body', :with => "Oldfoo")

    click_on("Update Post")

    page.must_have_content("Newbar")
    page.must_have_content("Oldfoo")
  end
end

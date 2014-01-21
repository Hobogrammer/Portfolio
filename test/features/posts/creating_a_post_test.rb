require "test_helper"

feature "Creating A Post" do
  scenario "submit form data to create a new post" do
    visit new_post_path

    fill_in('Title', :with => posts(:cr).title )
    fill_in('Body', :with => posts(:cr).body )

    click_on('Create Post')

    page.must_have_content(posts(:cr).title)
    page.must_have_content(posts(:cr).body)
  end
end

require "test_helper"

feature "Creating A Post" do
  scenario "submit form data to create a new post" do
    #Given an authorized user completes a new post form
   sign_in

    visit new_post_path

    fill_in('Title', :with => posts(:cr).title )
    fill_in('Body', :with => posts(:cr).body )

    click_on('Create Post')

    page.must_have_content(posts(:cr).title)
    page.must_have_content(posts(:cr).body)
    page.has_css? "#author"
    page.text.must_include users(:Joe).email
  end
end

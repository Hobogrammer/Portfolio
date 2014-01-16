require "test_helper"

feature "Creating A Post" do
  scenario "submit form data to create a new post" do
    visit new_post_path

    fill_in('Title', :with => 'Foobar')
    fill_in('Body', :with => 'Foobaz the blog post')

    click_on('Create Post')

    page.must_have_content('Foobar')
    page.must_have_content('Foobaz the blog post')
  end
end

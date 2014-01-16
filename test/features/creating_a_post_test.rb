require "test_helper"

feature "Creating A Post" do
  scenario "submit form data to create a new post" do
    visit new_post_path

    fill_in('title', :with => 'Foobar')
    fill_in('body', :with => 'Foobaz the blog post')

    click('Submit')

    page.should have_content('Foobar')
    page.should have_content('Foobaz the blog post')
  end
end

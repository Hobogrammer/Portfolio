require "test_helper"

feature "Creating A Post" do
  scenario "submit form data to create a new post" do
    #Given an authorized user completes a new post form
    sign_in(:author)

    visit new_post_path

    fill_in('Title', :with => posts(:cr).title )
    fill_in('Body', :with => posts(:cr).body )

    click_on('Create Post')

    page.must_have_content(posts(:cr).title)
    page.must_have_content(posts(:cr).body)
    page.has_css? "#author"
    page.text.must_include users(:author).email
    page.text.must_include "Status: Unpublished"
  end

  scenario "editors can create a new post" do
    sign_in(:editor)

    visit new_post_path

    fill_in('Title', :with => posts(:cr).title )
    fill_in('Body', :with => posts(:cr).body )

    click_on('Create Post')

    page.must_have_content(posts(:cr).title)
    page.must_have_content(posts(:cr).body)
    page.has_css? "#author"
    page.text.must_include users(:editor).email
    page.text.must_include "Status: Unpublished"
  end

  scenario "Unauthenticated site vistors cannot visit the new_post_path" do
    visit new_post_path

    page.must_have_content "You need to sign in or sign up before continuing."
  end

  scenario "Unauthenticated site vistors cannot see new post button" do
    #When I visit the blog index
    visit posts_path

    #Then I should not see the new post button
    page.wont_have_link "New Post"
  end

  scenario "authors can't publish" do
    #given an author's account
    sign_in(:author)

    #There is a checkbox for published
    visit new_post_path

    #page.wont_have_field('Published')

    page.wont_have_field('Published')
  end

  scenario "editors can publish" do
    sign_in(:editor)

    visit new_post_path

    page.must_have_field('Published')
    #When I submit the form

    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"

    click_on "Create Post"

    page.text.must_include "Status: Published"
  end
end

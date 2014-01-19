require "test_helper"

feature "Visiting The Post Index" do
  scenario "with existing posts,show list" do

    visit posts_path

    page.must_have_content(posts(:cr).title)
    page.must_have_content(posts(:cr).body)
  end

  scenario "loading the page" do

    visit posts_path

    page.must_have_css('.circular')
  end
end

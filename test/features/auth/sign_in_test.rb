require "test_helper"

feature "As a site visitor I want to sign in so that I can access my account" do
  scenario "signing in" do
    sign_in
    visit root_path

    page.must_have_content "Sign Out"
    page.wont_have_content "Sign In"
  end

  scenario "Sign in with twitter works" do
    visit root_path
    click_on "Sign In"

    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

    OmniAuth.config.add_mock(:twitter,{uid: '12345', info: { nickname: 'test_twitter_user'}})

    click_on "Sign in with twitter"
    save_and_open_page

    page.must_have_content "test_twitter_user, you are signed in!"
  end
end

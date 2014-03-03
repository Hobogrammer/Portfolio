require "test_helper"

feature "Mailers::SendingMail" do
  scenario "should send email" do
    visit contact_path

    fill_in "Name", with: "Test Bot"
    fill_in "Email", with: "test_bot@test.com"
    fill_in "Subject", with: "This is a test"
    fill_in "Body", with: "Still testing"

    click_on "Send"

    page.must_have_content "Message successfully sent"
  end
end

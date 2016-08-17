Given(/^they have created their account$/) do
  @squatter = FactoryGirl.create(:squatter, :first)
  @squatter.confirm
end

Given(/^they have logged in$/) do
  visit new_squatter_session_path
  fill_in "Email", with: @squatter.email
  fill_in "Password", with: @squatter.password
  click_on "Log in"
end

When(/^a squatter visits the edit account page$/) do
  visit edit_squatter_registration_path
end

When(/^they click "([^"]*)"$/) do |button_name|
  click_on button_name
end

When(/^they log out$/) do
  click_on "Log out"
end

When(/^they visit the log in page$/) do
  visit new_squatter_session_path
end

Then(/^they can log in via twitter$/) do
  expect(page).to have_content("Successfully authenticated from Twitter account")
end

Then(/^they can log in via facebook$/) do
  expect(page).to have_content("Successfully authenticated from Facebook account")
end

Then(/^they can log in via instagram$/) do
  expect(page).to have_content("Successfully authenticated from Instagram account")
end

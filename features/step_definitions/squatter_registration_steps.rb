Given(/^they are on the registration page$/) do
  visit new_squatter_registration_path
end

When(/^they provide a valid email address$/) do
  fill_in "Email", with: Faker::Internet.email
end

When(/^they provide a unique username$/) do
  fill_in "Username", with: Faker::Internet.user_name
end

When(/^they provide their password$/) do
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
end

When(/^they click sign up$/) do
  click_on "Sign up"
end

Then(/^they will be registered$/) do
  expect(page).to have_content("A message with a confirmation link")
end


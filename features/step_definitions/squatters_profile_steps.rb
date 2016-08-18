Given(/^an admin user has created an account$/) do
  @admin = FactoryGirl.create(:admin)
  @admin.confirm
end

Given(/^an admin is logged in$/) do
  visit new_squatter_session_path
  fill_in "Email", with: @admin.email
  fill_in "Password", with: @admin.password
  click_on "Log in"
end

Given(/^a second squatter has created an account$/) do
  @squatter2 = FactoryGirl.create(:squatter, :second)
  @squatter2.confirm
end

Given(/^the second squatter is logged in$/) do
  visit new_squatter_session_path
  fill_in "Email", with: @squatter2.email
  fill_in "Password", with: @squatter2.password
  click_on "Log in"
end

When(/^they visit the squatter's profile$/) do
  visit squatter_path(@squatter)
end

Then(/^they can see the squatter's location$/) do
  expect(page).to have_content(@squatter.location)
end

Then(/^they cannot see the squatter's location$/) do
  expect(page).to_not have_content(@squatter.location)
end

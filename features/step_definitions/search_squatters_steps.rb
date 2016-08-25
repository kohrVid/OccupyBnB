Given(/^some squatters have been created$/) do
  @roslind = FactoryGirl.create(:squatter, :third, username: "Roslind")
  @hedy = FactoryGirl.create(:squatter, :second, username: "hedy")
end

When(/^they type in Roslind$/) do
  fill_in "[search_username]", with: "Roslind"
end

When(/^they type in Ros$/) do
  fill_in "[search_username]", with: "Ros"
end

When(/^they type in roS$/) do
  fill_in "[search_username]", with: "roS"
end

Then(/^there should be one squatter in the results named Roslind$/) do
  expect(page).to have_content(@roslind.username)
  expect(page).to_not have_content(@hedy.username)
end


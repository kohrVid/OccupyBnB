Given(/^some abodes have been submitted and approved$/) do
  @approved_abode = FactoryGirl.create(:abode, :approved)
end

Given(/^some abodes have been submitted but remain unapproved$/) do
  @unapproved_abode = FactoryGirl.create(:abode, :unapproved)
end

When(/^they visit the abodes index page$/) do
  visit abodes_path
end

Then(/^they should be able to see approved abodes$/) do
  expect(page).to have_content(@approved_abode.title)
end

Then(/^they should be unable to see unapproved abodes$/) do
  expect(page).to_not have_content(@unapproved_abode.title)
end

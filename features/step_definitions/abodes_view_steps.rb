Given(/^some abodes have been submitted and approved$/) do
  @approved_abode = FactoryGirl.create(:abode, :approved)
end

When(/^they visit the abodes index page$/) do
  visit abodes_path
end

Then(/^they should be able to see approved abodes$/) do
  expect(page).to have_content(@approved_abode.title)
end

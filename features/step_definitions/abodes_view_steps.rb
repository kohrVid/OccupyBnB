Given(/^some abodes have been submitted and approved$/) do
  @approved_abode = FactoryGirl.create(:abode, :approved)
end

Given(/^some abodes have been submitted but remain unapproved$/) do
  @unapproved_abode = FactoryGirl.create(:abode, :unapproved)
end

When(/^they visit the abodes index page$/) do
  visit abodes_path
end

When(/^they visit the new abode page$/) do
  visit new_abode_path
end

When(/^they enter abode details$/) do
  @new_abode = FactoryGirl.build(:abode, :unapproved)
  fill_in "Title", with: @new_abode.title
  fill_in "Description", with: @new_abode.description
  fill_in "Location", with: @new_abode.location
  find(:css, "#abode_residential").set(true)
end

Then(/^are be able to see the abode in their list of submitted abodes$/) do
  expect(page).to have_content(@new_abode.title)
  expect(page).to have_content(@new_abode.description)
  expect(page).to have_content("#{@new_abode.location}\tYes")
end


Then(/^they are able to see approved abodes$/) do
  expect(page).to have_content(@approved_abode.title)
end

Then(/^they are unable to see unapproved abodes$/) do
  expect(page).to_not have_content(@unapproved_abode.title)
end

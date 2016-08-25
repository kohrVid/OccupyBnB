Given(/^an abode has been submitted and approved$/) do
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
  select @new_abode.sleeps_number, from: 'abode_sleeps_number'
  find(:css, "#abode_residential").set(true)
end

When(/^they enter abode details with a picture$/) do
  @new_abode = FactoryGirl.build(:abode, :unapproved)
  fill_in "Title", with: @new_abode.title
  attach_file("abode_abode_images_attributes_0_file_name", "features/support/abode.jpg", visible: false)
  fill_in "Description", with: @new_abode.description
  fill_in "Location", with: @new_abode.location
  select @new_abode.sleeps_number, from: 'abode_sleeps_number'
  find(:css, "#abode_residential").set(true)
end

When(/^they attach another picture$/) do
  attach_file("abode_abode_images_attributes_0_file_name", "features/support/abode2.jpg", visible: false)
end

When(/^they visit the abode's show page$/) do
  visit abode_path(@approved_abode)
end

Then(/^they are able to see approved abodes$/) do
  expect(page).to have_content(@approved_abode.title)
end

Then(/^they are unable to see unapproved abodes$/) do
  expect(page).to_not have_content(@unapproved_abode.title)
end

Then(/^they are be able to see the abode in their list of submitted abodes$/) do
  expect(page).to have_content(@new_abode.title)
  expect(page).to have_content(@new_abode.description)
  expect(page).to have_content("#{@new_abode.location}\tYes")
end

Then(/^they are be able to see the abode\'s image in their list of submitted abodes$/) do
  image_path = Abode.last.abode_images[0].file_name.url
  expect(page).to have_css('img[alt="Abode Image"]')
  expect(page).to have_css('img[src*="' + image_path + '"]')
end

Then(/^they are able to see a link to the second image$/) do
  image_path = Abode.last.abode_images.second.file_name.url
  expect(page).to have_css('a[href*="' + image_path + '"]')
end

Then(/^they can see the abode details$/) do
  expect(page).to have_content(@approved_abode.title)
  expect(page).to have_content(@approved_abode.description)
  expect(page).to have_content(@approved_abode.location)
  expect(page).to have_content(@approved_abode.sleeps_number)
end

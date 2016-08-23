def range_select(id, value)
  script = %-$(\"#{id}\").val(#{value});-
  page.execute_script(script)
end

Given(/^some abodes have been submitted and approved$/) do
  admin = FactoryGirl.create(:admin)
  @five_km = FactoryGirl.create(:abode, :approved, location: "West Ham, London", submitted_by: admin, approved_by: admin, sleeps_number: 2)
  @ten_km = FactoryGirl.create(:abode, :approved, location: "Liverpool Street, London", submitted_by: admin, approved_by: admin)
  @twenty_five_km = FactoryGirl.create(:abode, :approved, location: "Acton Town, London", residential: true, submitted_by: admin, approved_by: admin)
end

When(/^they visit the search page$/) do
  visit search_path
end

When(/^they select a distance of (\d+)km$/) do |distance|
  range_select("#abode_distance", distance)
end

When(/^they tick residential-only$/) do
  save_and_open_page
  find(:css, "#q_residential_only").set(true)
end

When(/^they tick non-residential-only$/) do
  save_and_open_page
  find(:css, "#q_non_residential_only").set(true)
end

When(/^they select a sleeps number of (\d+)$/) do |number|
  select number, from: "q[sleeps_number]"
end

Then(/^there should be one abode in the search results$/) do
  expect(page).to have_content(@five_km.title)
  expect(page).to have_content(@five_km.location)
  expect(page).to_not have_content(@ten_km.location)
  expect(page).to_not have_content(@twenty_five_km.location)
end

Then(/^there should be two abodes in the search results$/) do
  expect(page).to have_content(@five_km.title)
  expect(page).to have_content(@five_km.location)
  expect(page).to have_content(@ten_km.location)
  expect(page).to_not have_content(@twenty_five_km.location)
end

Then(/^there should be three abodes in the search results$/) do
  expect(page).to have_content(@five_km.title)
  expect(page).to have_content(@five_km.location)
  expect(page).to have_content(@ten_km.location)
  expect(page).to have_content(@twenty_five_km.location)
end

Then(/^there should be one residential abode in the results$/) do
  expect(page).to have_content(@twenty_five_km.title)
  expect(page).to have_content(@twenty_five_km.location)
  expect(page).to_not have_content(@ten_km.location)
  expect(page).to_not have_content(@five_km.location)
end

Then(/^there should be two non\-residential abode in the results$/) do
  expect(page).to have_content(@five_km.title)
  expect(page).to have_content(@five_km.location)
  expect(page).to have_content(@ten_km.location)
  expect(page).to_not have_content(@twenty_five_km.location)
end

Then(/^there should be one abode present that sleeps two\.$/) do
  expect(page).to have_content(@five_km.title)
  expect(page).to have_content(@five_km.location)
  expect(page).to_not have_content(@ten_km.location)
  expect(page).to_not have_content(@twenty_five_km.location)
end


When(/^they write a review$/) do
  fill_in "Summary", with: (@summary = "It was cold")
  fill_in "Body", with: (@body = "It was cold but not too cold")
end

When(/^they click on Add a review$/) do
  find("#add-abode-review").click
end

Then(/^they should see their review on the page$/) do
  visit current_path
  expect(page).to have_content(@summary)
  expect(page).to have_content(@body)
end

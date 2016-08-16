When(/^they enter their email address$/) do
  fill_in "Email", with: @squatter.email
end

When(/^they type in their password$/) do
  fill_in "Password", with: "password"
end

Then(/^they will be logged in successfully$/) do
  expect(page).to have_content("Signed in successfully.")
end

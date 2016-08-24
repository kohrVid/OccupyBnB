When(/^they click inbox$/) do
  click_link "inbox"
end

When(/^they write a message$/) do
  fill_in "Title", with: (@title = Faker::Lorem.words.join(" "))
  fill_in "Body", with: Faker::Lorem.paragraph
end

When(/^they receive a message$/) do
  @message = Message.create!(title: Faker::Lorem.words.join(" "),
			     body: Faker::Lorem.paragraph,
	    		     sender_id: @squatter2.id,
			     recipient_id: @squatter.id)
  step "they click inbox"
end

When(/^they click the reply button$/) do
  click_on @message.title
  click_link "reply"
end

When(/^they write a reply$/) do
  fill_in "Body", with: Faker::Lorem.paragraph
end

Then(/^they are redirected to their inbox$/) do
  expect(page).to have_content("Your Messages")
end

Then(/^the message appears in the recipient's inbox$/) do
  expect(page).to have_content(@title)
end

Then(/^the message should appear in the original sender's inbox$/) do
  click_on "Log Out"
  step "the second squatter is logged in"
  step "they click inbox"
  expect(page).to have_content(@title)
end

Then(/^the message appears in their sent items list$/) do
  click_on "Sent Items"
  expect(page).to have_content(@title)
end

Then(/^the message appears in their sent items list with Re: in the title$/) do
  click_on "Sent Items"
  expect(page).to have_content("Re: #{@title}")
end

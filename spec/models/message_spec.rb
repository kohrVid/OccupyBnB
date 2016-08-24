require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:sender) { FactoryGirl.create(:squatter, :first) }
  let(:recipient) { FactoryGirl.create(:squatter, :second) }

  it "should create a new message with valid attributes" do
    message = FactoryGirl.build(:message, sender: sender,
				recipient: recipient)
    expect(message).to be_valid
  end

  describe "title" do
    it "should be not exceed 40 characters" do
      message = FactoryGirl.build(:message, sender: sender,
				  recipient: recipient, title: "t"*41)
      expect(message).to_not be_valid
    end
  end
  
  describe "body" do
    it "should be present" do
      message = FactoryGirl.build(:message, body: "")
      expect(message).to_not be_valid
    end
  end
  
  describe "associations" do
    it "should have a sender" do
      message = FactoryGirl.build(:message, sender: nil,
				  recipient: recipient)
      expect(message).to_not be_valid
    end
    
    it "should have a recipient" do
      message = FactoryGirl.build(:message, recipient: nil,
				  sender: sender)
      expect(message).to_not be_valid
    end
    
    it "may have an reply" do
      message = FactoryGirl.build(:message, recipient: recipient,
				  sender: sender)
      expect(message).to respond_to(:replies)
    end
  end

  describe "receiving messages" do 
    before do 
      @message = Message.create!(sender: sender,
				 body: 'Are you at the disused train station?', 
				 recipient: recipient)
    end
   
    it "should show in recipients inbox" do 
      expect(recipient.reload.received_messages).to include(@message)
      expect(recipient.reload.sent_messages).to eq([])
      expect(@message.reload.recipient).to eq(recipient)
    end

    it "should show up in recipientes outbox" do 
      expect(sender.reload.sent_messages).to include(@message)
      expect(sender.reload.received_messages).to eq([])
    end 

    describe "replying" do
      before do
	@reply = Message.create!(sender: recipient, recipient: sender,
				 body: 'No, I live in the abandoned school',
				 replied_to: @message)
	
	sender.received_messages << @reply
      end

      it "should remember which message it was in reply to" do
	expect(@reply.reload.replied_to).to eq(@message)
	expect(@message.reload.replies).to include(@reply)
      end
=begin
      describe "history" do
        before do
	  @reply_to_reply = Message.create!(sender: sender,
					    recipient: recipient,
					    body: 'Sorry, my mistake.',
					    replied_to: @reply)
	end
	it "allows the original message to see the entire conversation history" do
	  #expect(@message.reload.history).to eq([@reply, @reply_to_reply])
	  expect(@message.reload.history).to include([@reply])
	  expect(@message.reload.history).to include([@reply_to_reply])
	end
      end
=end
    end
  end
end

require 'rails_helper'

describe Message do
  describe '#create' do

    it "is valid with a text" do
      message = build(:message, image: "")
      expect(message).to be_valid
    end

    it "is valid with a image" do
      message = build(:message, text: "")
      expect(message).to be_valid
    end

    it "is valid with a text and image" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a text and image" do
      message = build(:message, text: "", image: "")
      message.valid?
      expect(message.errors[:text_or_image][0]).to include("入力してください")
    end

  end
end

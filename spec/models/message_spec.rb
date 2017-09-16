require 'rails_helper'

describe Message do
  describe '#create' do

    it "is valid with a text" do
      message = build(:message, image: "")
      expect(message).to be_valid
    end

  end
end

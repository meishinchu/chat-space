require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { build(:user) }
  let(:group) { create(:group) }
  let(:messages) { create_list(:message, 2, user: user, group: group) }

  describe 'GET #index' do
    context "login user" do
      before do
        login_user user
        get :index, params: { group_id: group }
      end

      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq group
      end

      it "assigns the requested messages to @messages" do
        expect(assigns(:messages)).to eq messages
      end

      it "assigns the requested message to @message" do
        expect(assigns(:message)).to be_a_new Message
      end

      it "renders the :index template" do
      end
    end

    context "logout user" do
      it "renders the :index templat" do
      end
    end
  end

end

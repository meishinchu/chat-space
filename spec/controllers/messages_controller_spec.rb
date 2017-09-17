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
        expect(response).to render_template :index
      end
    end

    context "logout user" do
      it "redirect to new_user_session_path" do
        get :index, params: { group_id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end
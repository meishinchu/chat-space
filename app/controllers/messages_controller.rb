class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      flash[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
    @messages = @group.messages
  end

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id, group_id: @group.id)
  end
end

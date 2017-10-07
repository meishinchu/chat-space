class MessagesController < ApplicationController
  before_action :set_group
  before_action :set_message, only: [:create]

  def index
    @message = Message.new
    respond_to do |format|
      format.html { @messages = @group.messages }
      format.json { @new_message = @group.messages.where('id > ?', params[:id]) }
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path }
        format.json
      end
    else
      flash[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_message
    @messages = @group.messages
  end

  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id, group_id: @group.id)
  end
end

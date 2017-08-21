class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    if Group.create(group_params)
      flash.now[:notice] = "グループを作成しました"
      render "messages/index.html.haml"
    else
      flash.now[:alert] = "グループ名を入力してください"
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end
end

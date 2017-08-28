class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash.now[:notice] = "グループを作成しました"
      redirect_to controller: 'messages', action: 'index'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end
end

class GroupsController < ApplicationController
  def index
    @groups = Group.where(user_id: current_user.id)
    @total = Expense.where(user_id: current_user.id, group_id: params[:group_id]).sum(:amount)
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(params[:group].permit(:name, :icon))
    respond_to do |format|
      format.html do
        if @group.save
          redirect_to groups_path
        else
          render :new
        end
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end
end

class ExpensesController < ApplicationController
  def index
    @expenses = Expense.where(user_id: current_user.id, group_id: params[:group_id])
    @group = Group.find(params[:group_id])
    @total = Expense.where(user_id: current_user.id, group_id: params[:group_id]).sum(:amount)
  end

  def new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @expense = Expense.new(params[:expense].permit(:name, :amount, :group_id))
    @expense.user_id = current_user.id

    respond_to do |format|
      format.html do
        if @expense.save
          redirect_to group_expenses_path(@expense.group_id)
        else
          render 'Not saved'
        end
      end
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to group_expenses_path
  end
end

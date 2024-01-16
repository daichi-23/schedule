class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(params.require(:plan).permit(:title, :start, :end, :all_day, :memo))
    if @plan.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :plans
    else
      #render "new"
      flash[:error] = @plan.errors.full_messages
      redirect_to :new_plan
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(params.require(:plan).permit(:title, :start, :end, :all_day, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :plans
    else
      #render "edit"
      flash[:error] = @plan.errors.full_messages
      redirect_to edit_plan_path(@plan.id)
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :plans
  end

end

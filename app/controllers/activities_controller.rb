class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @activities = policy_scope(Activity)
    @lists = List.all
    @shootings = Shooting.all
    @activity = Activity.new
  end

  def show
    @activity = Activity.find(params[:id])
    authorize @activity
    @element = Element.new
    @elements = @activity.elements
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    authorize @activity
    if @activity.save
      redirect_to activities_path
    else
      redirect_to new_activity_path
    end
  end

  def update
    @activity = Activity.find(params[:id])
    authorize @activity
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity = Activity.find(params[:id])
    authorize @activity
    @activity.destroy
    redirect_to root_path
  end

  private

  def activity_params
    params.require(:activity).permit(:title)
  end

end

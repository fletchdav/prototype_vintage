class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @activities = policy_scope(Activity).sort_by { |activity| activity.position }
    i = 1
    @activities.each do |activity|
      activity.position = i
      activity.save
      i +=1
    end
    @lists = List.all
    @shootings = Shooting.all
    @activity = Activity.new
  end

  def show
    @activity = Activity.find(params[:id])
    authorize @activity
    @element = Element.new
    @elements = @activity.elements.sort_by { |element| - element.position }
    i = @elements.length
    @elements.each do |element|
      element.position = i
      element.save
      i -=1
    end
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    authorize @activity
    if @activity.save
      redirect_to activity_path(@activity)
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
    redirect_to activities_path
  end

  def up
    @activity = Activity.find(params[:id])
    authorize @activity
    activity_to_downgrade = Activity.where(position: @activity.position - 1).first
    @activity.position -= 1
    activity_to_downgrade.position += 1
    @activity.save
    activity_to_downgrade.save
    redirect_to activities_path
  end

    def down
    @activity = Activity.find(params[:id])
    authorize @activity
    activity_to_upgrade = Activity.where(position: @activity.position + 1).first
    @activity.position += 1
    activity_to_upgrade.position -= 1
    @activity.save
    activity_to_upgrade.save
    redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:title)
  end

end

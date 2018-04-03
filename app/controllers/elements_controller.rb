class ElementsController < ApplicationController

def create
  @activity = Activity.find(params[:activity_id])
  @element = Element.new(element_params)
  authorize @element
  @element.activity = @activity
  if @element.save
    redirect_to activity_path(@activity)
  else
    redirect_to activity_path(@activity)
  end
end

def edit
  @activity = Activity.find(params[:activity_id])
  @element = Element.find(params[:id])
  authorize @element
end

def update
  @element = Element.find(params[:id])
  authorize @element
  @activity = Activity.find(params[:activity_id])
  if @element.update(element_params)
    redirect_to activity_path(@activity)
  else
    render :edit
  end
end

def destroy
  @activity = Activity.find(params[:activity_id])
  @element = Element.find(params[:id])
  authorize @element
  @element.destroy
  redirect_to activity_path(@activity)
end

private
def element_params
  params.require(:element).permit(:display, :content, :photo)
end


end

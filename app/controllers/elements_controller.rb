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

private
def element_params
  params.require(:element).permit(:tite, :display, :content, :photo)
end


end

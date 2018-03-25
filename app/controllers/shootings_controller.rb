class ShootingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @lists = List.all
    @shooting = Shooting.find(params[:id])
    authorize @shooting
    @shooting_shoots = []
    @shooting.shoot_shows.each { |shoot_show| @shooting_shoots << shoot_show.shoot }
    @shoot = Shoot.new
    @shootings = Shooting.all || []
  end

  def new
    @shooting = Shooting.new
    authorize @shooting
  end

  def create
    @shooting = Shooting.new(shooting_params)
    authorize @shooting
    if @shooting.save
      redirect_to shooting_path(@shooting)
    else
      redirect_to new_shooting_path #pas possible
    end
  end

    def update
    @shooting = Shooting.find(params[:id])
    authorize @shooting
    @shooting.update(shooting_params)
    redirect_to shooting_path(@shooting)
  end

  def destroy
    @shooting = Shooting.find(params[:id])
    authorize @shooting
    @shooting.destroy
    redirect_to root_path
  end

  private
  def shooting_params
    params.require(:shooting).permit(:title, :is_special)
  end

end

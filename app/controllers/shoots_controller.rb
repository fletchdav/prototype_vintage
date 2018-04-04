class ShootsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @lists = List.all
    @shootings = Shooting.all
    @shoots = policy_scope(Shoot)
      .select { |shoot| shoot.shoot_shows.count > 0 }
    @shoots = []
    @shootings.each do |shooting|
      shooting.shoot_shows.each { |shoot_show| @shoots << shoot_show.shoot }
    end
  end

  def create
    @shooting = Shooting.find(params[:shooting_id])
    @shoot = Shoot.new(shoot_params)
    authorize @shoot
    if @shoot.save
      ShootShow.create(shoot: @shoot, shooting: @shooting)
      redirect_to shooting_path(@shooting)
    else
      redirect_to shooting_path(@shooting)
    end
  end

  def edit
    @shoot = Shoot.find(params[:id])
    authorize @shoot
    @shooting = Shooting.find(params[:shooting_id])
  end

  def update
    @shoot = Shoot.find(params[:id])
    authorize @shoot
    @shooting = Shooting.find(params[:shooting_id])
    if @shoot.update(shoot_params)
      redirect_to shooting_path(@shooting)
    else
      render :edit
    end
  end

  def destroy
    @shoot = Shoot.find(params[:id])
    authorize @shoot
    shooting = Shooting.find(params[:shooting_id])
    shoot_show = @shoot.shoot_shows.where(:shooting_id == params[:shooting_id])
    shoot_show.first.destroy
    redirect_to shooting_path(shooting)
  end

  private
  def shoot_params
    params.require(:shoot).permit(:description, :photo)
  end
end

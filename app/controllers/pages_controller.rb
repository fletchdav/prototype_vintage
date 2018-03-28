class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :contact, :activity]
  def home
    @list = List.new
    @lists = List.all || []
    @special_lists = List.where(is_special: true)
    @shootings = Shooting.all || []
  end

  def about
    @list = List.new
    @lists = List.all || []
    @special_lists = List.where(is_special: true)
    @shootings = Shooting.all || []
  end

  def contact
    @list = List.new
    @lists = List.all || []
    @special_lists = List.where(is_special: true)
    @shootings = Shooting.all || []
  end

  def activity
    @list = List.new
    @lists = List.all || []
    @special_lists = List.where(is_special: true)
    @shootings = Shooting.all || []
  end

end

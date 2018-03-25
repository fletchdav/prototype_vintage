class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @list = List.new
    @lists = List.all || []
    @special_lists = List.where(is_special: true)
    @shootings = Shooting.all || []
  end

  def about
  end

  def contact
  end
end


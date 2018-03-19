class PagesController < ApplicationController
  def home
    @list = List.new
    @lists = List.all
  end
end


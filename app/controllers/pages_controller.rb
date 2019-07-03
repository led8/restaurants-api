class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @restaurants = Restaurant.where('name ILIKE ?', "%#{params[:query]}%")
    else
      @restaurants = Restaurant.all
    end
  end
end

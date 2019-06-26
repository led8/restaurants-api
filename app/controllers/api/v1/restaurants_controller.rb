class Api::V1::RestaurantsController < Api::V1::BaseController
  before_action :set_restaurant, only: [ :show ]

  def index
    if params[:search].blank?
      @restaurants = policy_scope(Restaurant)
    else
      @restaurants = policy_scope(Restaurant).where('name ILIKE ?', "%#{params[:search]}%")
    end
  end

  def show
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end
end

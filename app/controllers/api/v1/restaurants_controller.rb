class Api::V1::RestaurantsController < Api::V1::BaseController
  # skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_restaurant, only: [ :show, :update,  :destroy]


  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
    authorize @restaurant 
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
    if @restaurant.save
      render :show, status: :created
    else
      render_error
    end
  end


  def update
    if @restaurant.update(restaurant_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @restaurant.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end


private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant  # For Pundit
  end
end

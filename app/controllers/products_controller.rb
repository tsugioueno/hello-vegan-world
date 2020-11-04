class ProductsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  before_action :set_product, only: [:edit, :update]
  before_action :find_product, only: [:show, :destroy]

  def index
    @products = Product.includes(:user).order("created_at DESC")
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def find_product
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:image,:product_name,:product_text,:category_id, :product_condition_id, :shipping_charge_id,:shipping_area_id,:days_to_ship_id,:price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

class Api::CartController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if params[:session_id].present?
      cart_items = CartItem.where(session_id: params[:session_id])
    else
      cart_items = CartItem.all
    end
    render json: cart_items
  end

  def create
    cart_item = CartItem.new(cart_params)
    if cart_item.save!
      render json: cart_item, status: :created
    else
      render json: { errors: cart_item.errors.full_messages }, status: :unprocessble_entity
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:product_id, :quantity, :session_id)
  end
end

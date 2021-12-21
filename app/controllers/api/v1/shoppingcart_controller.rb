class Api::V1::ShoppingcartController < ApplicationController
  before_action :authenticate, only: [:create]

  def index
    @shoppingcarts = Shoppingcart.all
    render json: @shoppingcarts
  end

  def create
    @shoppingcart = Shoppingcart.create!(shoppingcart_params)
    render json: @shoppingcart
  end

  private

  def shoppingcart_params
    params.permit(:user_id, :item_id)
  end
end

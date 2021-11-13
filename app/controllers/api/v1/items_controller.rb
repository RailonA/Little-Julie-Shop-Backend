class Api::V1::ItemsController < ApplicationController

  def index
    @items = Item.all
    render json: @items.to_json(include: {
                                  itemPhoto: {
                                    include: :blob
                                  }
                                })
  end

  private

  def item_params
    params.require(:item).permit(:itemPhoto, :itemName, :itemPrice)
  end
end

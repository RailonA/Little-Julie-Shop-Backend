class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items.to_json(include: {
                                  itemPhoto: {
                                    include: :blob
                                  }
                                })
  end
end

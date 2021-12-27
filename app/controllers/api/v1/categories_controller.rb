class Api::V1::CategoriesController < ApplicationController
  def index
    @category = Categories.all
    render json: @category
  end

  def show
    @category = Categories.all
    render json: @category.to_json
  end

  private

  def user_params
    params.require(:category).permit(:items, :name, :parent_id)
  end
end

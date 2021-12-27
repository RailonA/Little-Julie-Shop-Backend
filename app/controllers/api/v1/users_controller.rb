class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render json: @user.to_json(include: { shoppingcarts: {
                                 include: { item: {
                                   only: %i[id category itemphoto itemname]
                                 } },
                                 only: %i[id user_id item_id]
                               } })
  end

  def create
    # rubocop:disable Style/RedundantBegin
    begin
      @user = User.create!(user_params)
      render json: @user
    rescue ActiveRecord::RecordInvalid => e
      render json: {
        error: e.to_s
      }, status: 422
    end
    # rubocop:enable Style/RedundantBegin
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end

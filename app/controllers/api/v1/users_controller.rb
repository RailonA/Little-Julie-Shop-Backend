class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render json: @user.to_json(include: { appointments: {
                                 include: { service: {
                                   only: %i[id category petService serviceDescription servicePrice]
                                 } },
                                 only: %i[id date service_id user_id created_at]
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

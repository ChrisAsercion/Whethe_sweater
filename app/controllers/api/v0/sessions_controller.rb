class Api::V0::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
      render json: UserSerializer.format_user(user)
    else 
      render json: {errors: "Credentials do not match"}, status: :unprocessable_entity
    end
  end
end
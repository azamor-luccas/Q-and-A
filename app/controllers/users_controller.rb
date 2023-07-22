class UsersController < ApplicationController
  def create
    data = params.permit(:name, :picture_url)
    user = User.first_or_create(data)
    if user.save
      return render json: user, status: :ok
    end

    return render json: { message: "Error"}, status: :unprocessable_entity
  end
end

class AnswersController < ApplicationController
  def create
    data = params.permit([:description, :user_id, :question_id])
    answer = Answer.create(data)
    if answer.save
      return render json: answer.as_json(
        only: [:id, :description, :user_id, :created_at]
      ), status: :ok
    end

    return render json: { message: "Error" }, status: :unprocessable_entity
  end
end

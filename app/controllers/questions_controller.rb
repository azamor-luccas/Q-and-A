# QuestionsController handles listing, displaying, and creating questions.
class QuestionsController < ApplicationController
  def index
    page = params[:page] || 0
    questions = Question.limit(10).offset(page * 10)
    render json: questions.as_json(only: %i[id description]), status: :ok
  end

  def show
    question = Question.find_by(id: params[:id])

    if question.nil?
      return render json: { message: 'Not found' }, status: :not_found
    end

    render json: question.as_json(
      only: %i[id description created_at],
      include: [user: { only: %i[id name picture_url] },
                answers: { only: %i[id description created_at] }]
    ), status: :ok
  end

  def create
    data = params.permit(:description, :user_id)
    question = Question.create(data)
    if question.save
      return render json: question.as_json(
        only: %i[id description created_at]
      ), status: :ok
    end

    render json: { message: 'Error' }, status: :unprocessable_entity
  end

  def popular; end
end

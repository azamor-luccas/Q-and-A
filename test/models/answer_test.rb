require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test 'should not create answer with user_id null' do
    answer = Answer.new
    question = Question.first
    answer.question = question
    assert_not answer.save, 'Saved answer with user_id null'
  end

  test 'should not create answer with question_id null' do
    answer = Answer.new
    user = User.first
    answer.user = user
    assert_not answer.save, 'Saved answer with question_id null'
  end
end

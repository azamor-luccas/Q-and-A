class Like < ApplicationRecord
  belongs_to :user
  belongs_to :question, optional: true
  belongs_to :answer, optional: true

  validate :belongs_to_question_xor_answer
end

private

def belongs_to_question_xor_answer
  unless question_id.nil? ^ answer_id.nil?
    errors.add(:question_id, "Either Question or Answer needs a value")
  end
end

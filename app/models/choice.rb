class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :answers

  validates :question_id, :text, presence: true
end

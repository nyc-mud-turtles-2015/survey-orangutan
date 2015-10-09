class Answer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :response
  has_one :user, through: :response

  validates :response_id, :choice_id, presence: true
end

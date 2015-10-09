class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices

  validates :survey_id, :prompt, presence: true
end

class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :answers

  validates :user_id, :survey_id, presence: true
end

class Survey < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :responses
  has_many :respondants, through: :responses, source: :user

  validates :author_id, :title, presence: true
end

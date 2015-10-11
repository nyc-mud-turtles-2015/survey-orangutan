class Survey < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :responses
  has_many :respondants, through: :responses, source: :user
  has_many :choices, through: :questions
  has_many :answers, through: :choices

  
  def top_choice_count
    top_choice, count = self.answers
                          .order('count_id DESC')
                          .group(:choice_id)
                          .count(:id)
                          .first
    count
  end


  validates :author_id, :title, presence: true
end

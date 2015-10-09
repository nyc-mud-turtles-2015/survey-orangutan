class User < ActiveRecord::Base
  include BCrypt

  # has_many :surveys
  has_many :authored_surveys, class_name: "Survey", foreign_key: :author_id
  has_many :responses
  has_many :surveys_taken, through: :responses, source: :survey
  has_many :answers, through: :responses

  validates :name, :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

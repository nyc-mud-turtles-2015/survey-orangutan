def seed!
  # create users
  25.times do
    # random name, password is "password" (for testing)
    User.create(name: random_username, password: "password")  
  end
  users = User.all

  # create surveys
  10.times do
    # random user and title
    survey = Survey.create(author: users.sample, title: random_title)
    # several questions on each survey
    3.times do
      # get a random question and some answers
      question_prompt, choice_texts = random_q_and_a
      # create the question
      question = Question.create(survey: survey, prompt: question_prompt)
      # create choices on the question
      choice_texts.each do |choice_text|
        Choice.create(question: question, text: choice_text)
      end
    end
  end
  surveys = Survey.all

  # take each survey
  surveys.each do |survey|
    # with ten random users
    users.sample(10).each do |user|
      # create a response
      response = Response.create(user: user, survey: survey)
      # answer each question
      survey.questions.each do |question|
        # with a random choice
        Answer.create(response: response, choice: question.choices.sample)
      end
    end
  end
end


def random_username
  Faker::Internet.user_name + Faker::Number.between(1960,2000).to_s
end

def random_title
  survey_nouns = ["Choices","Feedback","Opinions","Answers","Responses","Preferences","Favorites"]
  "#{Faker::Hacker.ingverb.capitalize} Your #{survey_nouns.sample}"
end

def random_q_and_a
  q_and_a_generator = [ 
    [ lambda { "What's your favorite #{Faker::Team.sport} team?" },
      lambda { Faker::Team.name } ],
    [ lambda { "What's your favorite #{Faker::Name.name} book?" },
      lambda { Faker::Book.title } ],
    [ lambda { "What's your favorite #{Faker::Name.name} quote?" },
      lambda { "\"#{Faker::Hacker.say_something_smart}\"" } ],
    [ lambda { "What's your favorite app for #{Faker::Hacker.ingverb} #{Faker::Hacker.abbreviation}?" },
      lambda { Faker::App.name } ],
    [ lambda { "What's your favorite movie starring #{Faker::Name.name}?" },
      lambda { "#{Faker::Book.title}  + " " + #{Faker::Number.between(2,5)}" } ]
  ].sample
  question = q_and_a_generator[0].call
  answers = (2..4).map { q_and_a_generator[1].call }
  return question, answers
end

seed!
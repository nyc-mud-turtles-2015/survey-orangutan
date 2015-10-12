get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  @errors = []
  @question = Question.new
  @choices = []
  erb :'questions/new'
end

post '/surveys/:id/questions' do
  survey = Survey.find_by(id: params[:id])
  question = Question.new(survey: @survey, prompt: params[:prompt])
  choices = []
  errors = []
  if question.save
    params[:choices].each do |_, choice_text|
      if choice_text.strip != ""
        choice = Choice.new(question: question, text: choice_text.strip)
        if choice.save
          choices << choice
        else
          errors += choice.errors.full_messages
        end
      end
    end
  else
    errors += question.errors.full_messages
  end
  if choices.count < 2
    errors << "You must add at least two choices"
  end
  if !errors.empty?
    choices.each { |choice| choice.destroy }
    question.destroy
    redirect :"/surveys/#{survey.id}/questions/new?#{params.to_query}"
  else
    redirect :"/surveys/#{survey.id}/questions/new"
  end
end
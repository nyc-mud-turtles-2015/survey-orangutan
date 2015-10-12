get '/surveys/:id/responses/new' do
  @survey = Survey.find_by(id: params[:id])
  erb :'responses/new'
end

post '/surveys/:id/responses' do
  user = current_user
  survey = Survey.find_by(id: params[:id])
  response = Response.new(user: user, survey: survey)
  @errors = []
  if response.save
    survey.questions.each do |question|
      choice = Choice.find_by(id: params["q_#{question.id}"])
      answer = Answer.new(response: response, choice: choice)
      if !answer.save
        @errors += answer.errors.full_messages
      end
    end
  else
    @errors += response.errors.full_messages
  end
  if @errors.empty?
    redirect "/surveys/#{params[:id]}/complete"
  else
    redirect "/surveys/#{params[:id]}/responses/new"
  end
end
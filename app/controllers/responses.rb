get '/surveys/:id/responses/new' do
  @survey = Survey.find(params[:id])
  erb :'responses/new'
end

post '/surveys/:id/responses' do
  user = User.first # placeholder until auth is ready
  survey = Survey.find(params[:id])
  response = Response.new(user: user, survey: survey)
  @errors = []
  if response.save
    survey.questions.each do |question|
      choice = Choice.find(params["q_#{question.id}"])
      answer = Answer.new(response: response, choice: choice)
      if !answer.save
        @errors << answer.errors.full_messages
      end
    end
  else
    @errors << response.errors.full_messages
  end
  if @errors.empty?
    redirect "/surveys/#{params[:id]}/complete"
  else
    erb "/surveys/#{params[:id]}/responses/new"
  end
end
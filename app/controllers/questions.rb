get '/questions' do
  @survey = Survey.find_by(params[:id])
  @questions = Question.where(params[:survey_id])
  @choice = Choice.where(params[:question_id])

  erb :'questions/show'
end

get '/questions/new' do
  if logged_in?
    erb :'questions/new'
  else
    erb :'sorry'
  end
end


get '/questions/:survey_id' do
  @questions = Question.find_by(params[:survey_id])
  erb :'questions/:id/index'
end


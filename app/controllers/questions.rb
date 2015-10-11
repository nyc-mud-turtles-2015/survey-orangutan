get '/questions/:id' do
  @survey = Survey.find_by(id: params[:id])
  @question = Question.find_by(id: params[:id])
  erb :'questions/show'
end

get '/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  erb :'questions/new'
end

post '/surveys' do
  @question = Question.new(params[:question])
  if @question.save
    redirect '/surveys/#{survey.id}'
  else
    @question.errors.messages
    erb :'questions/new'
  end
end
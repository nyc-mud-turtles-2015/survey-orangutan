get '/surveys' do
  user = current_user
  @surveys = user.available_surveys
  erb :'surveys/index'
end

get '/surveys/:id/complete' do
  @survey = Survey.find(params[:id])
  erb :'surveys/complete'
end

get '/surveys/new' do
  erb :'surveys/new'
end

post '/surveys' do
  user = current_user
  survey = Survey.new(author: user, title: params[:title])
  if survey.save
    redirect "/surveys/#{survey.id}/questions/new"
  else
    @errors = survey.errors.full_messages
    erb :'surveys/new'
  end
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :'surveys/show'
end
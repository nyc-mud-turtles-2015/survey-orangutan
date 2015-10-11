get '/surveys' do
  @surveys = Survey.order(created_at: :desc).includes(:questions)
  erb :'surveys/index'
end

get '/surveys/:id/complete' do
  @survey = Survey.find(params[:id])
  erb :'surveys/complete'
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :'surveys/show'
end
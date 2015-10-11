get '/surveys' do
  @surveys = Survey.order(created_at: :desc).includes(:questions)
  erb :'surveys/index'
end
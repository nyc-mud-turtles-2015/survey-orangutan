get '/surveys/:id/responses/new' do
  @survey = Survey.find(params[:id])
  erb :'responses/new'
end
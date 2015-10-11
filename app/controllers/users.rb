get '/' do
  erb :index
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  "hello world"
  # user = User.find_by(params[:user][:name])
  #   if user.save
    puts "be cool"
    # redirect '/'
  # else
  #   puts "be uncool"
    # redirect '/'
  # end
end


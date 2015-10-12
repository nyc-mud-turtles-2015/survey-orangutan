get '/' do
  erb :index
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  user = User.find_by(params[:user][:name])
    if user.save
      "HELLO WORLD"
  else
    "GOODBYE CRUEL WORLD"
  end
end

get '/signup' do
  erb :'users/signup'
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
    redirect '/'
  else
    redirect '/signup'
  end
end
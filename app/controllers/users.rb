get '/' do
  erb :index
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  user = User.find_by(name: params[:user][:name])
  if user && user.password == params[:user][:password]
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
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
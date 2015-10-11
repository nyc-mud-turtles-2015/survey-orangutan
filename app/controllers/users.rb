get '/' do
  erb :index
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    puts "be cool"
    redirect '/'
  else
    puts "be uncool"
    redirect '/'
  end
end
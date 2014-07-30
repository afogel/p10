get '/users/new' do
  erb :sign_up
end

post '/users' do
  p params
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.messages
    erb :sign_up
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :user
end


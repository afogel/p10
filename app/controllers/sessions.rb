get '/sessions/new' do
  # @email = params[:email]
  # user = User.find_by(email: @email)
  # if flash[:error]
  #   @error = flash[:error]
  # end
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user && @user.password==params[:password]
    session[:user_id] = @user.id
  end
  if logged_in?
    redirect "/users/#{@user.id}"
  else
    # flash[:error] = "Password and/or email incorrect"
    redirect '/sessions/new'
  end
end

delete '/sessions/:id' do
  session[:user_id] = nil
  redirect '/'
end

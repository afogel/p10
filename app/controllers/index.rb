get '/' do
  if logged_in?
    redirect "/users/#{current_user.id}"
  else
    erb :index
  end
end

post '/' do
  if logged_in?
    redirect "/users/"
  end
end

post '/texts' do
  @user = User.find(params[:user_id])
  friend_and_message = { @user.phone_number => params[:message]}
  test_message = TwilioWrapper.new(friend_and_message)
  test_message.send!
  redirect "/users/#{@user.id}"
end

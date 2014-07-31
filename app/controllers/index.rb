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
  user_and_message = [{ :message => params[:message],
                       :phone_number => @user.phone_number}]
  test_message = TwilioWrapper.new(user_and_message)
  test_message.send!
  redirect "/users/#{@user.id}"
end

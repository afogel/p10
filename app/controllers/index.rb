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
  raise "ERROR MOTHERFUCKER"
  @user = User.find(params[:user_id])
  user_and_message = [{ :message => params[:message],
                       :phone_number => @user.phone_number}]
  raise "ERROR MOTHERFUCKER"
  test_message = TwilioWrapper.new(user_and_message)
  raise "ERROR MOTHERFUCKER"
  test_message.send!
  raise "ERROR MOTHERFUCKER"
  redirect "/users/#{@user.id}"
end

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
  p "I passed the AR lookup"
  user_and_message = [{ :message => params[:message],
                       :phone_number => @user.phone_number}]
  test_message = TwilioWrapper.new(user_and_message)
  p "I created a new TwilioWrapper"
  test_message.send!
  p "I sent a twiliowrapper"
  redirect "/users/#{@user.id}"
end

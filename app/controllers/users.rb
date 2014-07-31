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
  if logged_in?
    @user = User.find(params[:id])
    @contacts = @user.contacts
    erb :user
  else
    redirect '/'
  end
end

get '/contacts/new' do
  erb :contact
end

post '/contacts' do
  contact_interval = params[:contact_interval].to_i
  .send(params[:interval_units]).to_i.
  seconds_to_days
  p contact_interval
  @new_contact = Contact.new(first_name: params[:first_name],
                             last_name: params[:last_name],
                             phone_number: params[:phone_number],
                             email_address: params[:email_address],
                             user_id: current_user.id,
                             contact_interval: contact_interval,
                             last_reminder: params[:last_reminder],
                             reminder_message: params[:reminder_message])
  if @new_contact.valid?
    @new_contact.save
    redirect "/users/#{current_user.id}"
  else
    puts "ERROR MOTHERFUCKER"
  end
end

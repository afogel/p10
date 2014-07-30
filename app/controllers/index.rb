get '/' do
  if logged_in?
    redirect "/users/:id"
  else
    erb :index
  end
end

post '/' do
  if logged_in?
    redirect "/users/"
  end
end

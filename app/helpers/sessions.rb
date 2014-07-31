def current_user
  p "I'm a current_user"
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  p "I'm out of the current_user business"
end

def logged_in?
  p "I'm logged in"
  current_user
  p "I was truthy"
end

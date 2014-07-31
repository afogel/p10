def current_user
  p "I'm a current_user"
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def logged_in?
  p "I'm logged in"
  current_user
end

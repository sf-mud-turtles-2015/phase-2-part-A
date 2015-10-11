def authenticated?
  session[:user_id] != nil
end

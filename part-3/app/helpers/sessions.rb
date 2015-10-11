helpers do
  def session_setter(user)
    session[:owner_id] = user.id
    session[:user_name] = user.name
  end
end

helpers do

  def auth_login(user)
    session[:user_id] = user.id
  end

  def auth_logout
    session.destroy
    redirect '/'
  end

  def get_user
    @user = User.find(session[:user_id])
  end

end

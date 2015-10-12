
def error_message(errors)
  if errors
    # there should be multiple errors, dunno why its not triggered??
    errors.each do |name, problem|
       return "Error: #{name} #{problem[0]}"
    end
  end
end


def logged_in?(value)
  # if user has not logged in session and @item.user_id will be nil I think...
  #.. something was going on so I throw this in
  if session[:user_id] == @item.user_id && session[:user_id] != nil
     return true
  else
     return false
  end
end


# <% if session[:user_id] != nil && session[:user_id] != @item.user_id %> #line 20....


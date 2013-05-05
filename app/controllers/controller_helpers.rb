def redirect_if_not_logged_in
  unless session[:user_id]
    redirect_to root_url, alert: "Please Login to use that function"
    return true
  end
  false
end

def redirect_if_specific_user_not_logged_in(user, message)
  return true if redirect_if_not_logged_in
  unless user.id == session[:user_id] 
    redirect_to users_url, alert: "#{message}"
    return true
  end
  false
end
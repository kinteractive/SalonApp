module SessionsHelper
  
  def sign_in(user)
    cookies[:remember_token] = { :value => user.remember_token, expires: 1.hour.from_now.utc }
    current_user = user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def is_admin?
    if !current_user.nil?
      current_user.email == 'prashant@pinksthebeautyboutique.com' || 'shelby@pinksthebeautyboutique.com' || 'vanessa@pinksthebeautyboutique.com' || 'prashant_sridharan@hotmail.com'
    else
      false
    end
  end
  
  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: t('sign-in-first')
    end
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  private

    def user_from_remember_token
      remember_token = cookies[:remember_token]
      User.find_by_remember_token(remember_token) unless remember_token.nil?
    end
    
    def clear_return_to
      session.delete(:return_to)
    end
  
end

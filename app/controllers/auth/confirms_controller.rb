class Auth::ConfirmsController < Auth::BaseController

  def new
    confirm_and_or_redirect_user(params[:token]) if params[:token].present?
  end


  private

  def confirm_and_or_redirect_user(token)
    user = User.where(confirmation_token: params[:token]).first
    # Eingeloggt? (und bestätigt... implizit)
    if session[:user_id].present?
      redirect_to root_path, info: "You are already logged in!"
    # Schon Bestätigt??
    elsif user&.confirmed?
      redirect_to login_path, info: "Email already confirmed. Please login!"
    # Noch nicht bestätigt?
    elsif user && !user.confirmed?
      user.update_attributes(confirmed_at: DateTime.now)
      session[:user_id] = user.id
      redirect_to root_path, success: "Thanks for confirming your email!"
    # Mongo!
    else
      redirect_to login_path, warning: "Invalid token, du Mongo!"
    end
  end
end

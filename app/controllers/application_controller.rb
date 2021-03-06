class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user! 
  before_filter :configure_permitted_parameters, if: :devise_controller?

  layout "main"
  
  def home
    @user = User.find(current_user.id); 
    @book = Book.new
  end

  protected
  def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :point) }
  end
end

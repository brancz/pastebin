class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' || c.request.format == 'text/plain' }

  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
      devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation)}
  end

end

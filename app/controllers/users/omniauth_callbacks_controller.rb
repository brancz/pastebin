class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_github_oauth2(request.env["omniauth.auth"], current_user)
    @user.skip_confirmation!
    @user.save

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "GitHub"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end

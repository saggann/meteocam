class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter

    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"])
    logger.debug "#############################"
    logger.debug request.env["omniauth.auth"].except("extra")
    
    if @user.persisted?
      
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?

    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
     
      redirect_to new_user_registration_url
    end

  end
end



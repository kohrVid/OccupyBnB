class CallbacksController < Devise::OmniauthCallbacksController

  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
	@squatter = Squatter.find_for_oauth(env["omniauth.auth"], current_squatter)

	if @squatter.persisted?
	  sign_in_and_redirect @squatter, event: :authentication
	  set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
	else
	  session["devise.#{provider}_data"] = env["omniauth.auth"]
	  redirect_to new_squatter_registration_url
	end
      end
    }
  end

  [:twitter, :facebook, :instagram].each do |provider|
    provides_callback_for provider
  end

  def after_sign_in_path_for(resource)
    if resource.email_verified?
      super resource
    else
      finish_signup_path(resource)
    end
  end
end

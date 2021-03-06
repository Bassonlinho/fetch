class RegistrationsController < Devise::RegistrationsController
  
  # POST /resource
  def create
  	build_resource(sign_up_params)

  	resource.save
  	yield resource if block_given?
  	if resource.persisted?
  		if resource.active_for_authentication?
  			RegistrationWorker.perform_async(@user.email)
  			set_flash_message! :notice, :signed_up
  			sign_up(resource_name, resource)
  			respond_with resource, location: after_sign_up_path_for(resource)
  		else
  			set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
  			expire_data_after_sign_in!
  			respond_with resource, location: after_inactive_sign_up_path_for(resource)
  		end
  	else
  		clean_up_passwords resource
  		set_minimum_password_length
  		respond_with resource
  	end
  end

  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
  	tasks_path
  end

end
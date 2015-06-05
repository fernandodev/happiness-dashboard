class Registrations::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]
  # before_filter :configure_account_update_params, only: [:update]

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def build_nested_attributes(hash)
    hash[:company_attributes] = {}
    hash
  end

  def build_resource(hash=nil)
    hash = hash || build_nested_attributes({})
    self.resource = resource_class.new_with_session(hash, session)
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) do |devise|
      devise.permit(
        :email,
        :password,
        :password_confirmation,
        { company_attributes: [:name] }
      )
    end
  end

  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :company
  # end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  # def account_update_params
  #   devise_parameter_sanitizer.sanitize(:account_update)
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

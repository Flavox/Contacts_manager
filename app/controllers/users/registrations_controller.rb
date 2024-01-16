# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super do
      if resource.errors.empty?
        # flash[:notice] = "This contact is not yours."
        redirect_to edit_user_registration_path, notice: "Account created successfully."
      else
        redirect_to edit_user_registration_path, alert: "Error with some field"
        puts "ERROR from registration_controller - #{current_user}: #{resource.errors}"
      end
      return
    end
  end

  # GET /resource/edit
  def edit
    @relations = current_user.relations
    @mycontacts = current_user.contacts
    @contacts_without_relation = @mycontacts.left_outer_joins(:contact_relations).where(contact_relations: { id: nil })
  end

  # PUT /resource
  def update
    super do
      if resource.errors.empty?
        redirect_to edit_user_registration_path, notice: "Account updated successfully."
      else
        redirect_to edit_user_registration_path, alert: "Do you entered your password correctly ?"
        puts "#{current_user}: #{resource.errors}"
      end
      return
    end
  end

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

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

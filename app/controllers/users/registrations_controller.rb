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
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: edit_user_registration_path
      else
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
        puts "--------ERROR from registration_controller - create user : #{resource.errors.full_messages[0]}"
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
        clean_up_passwords resource
        set_minimum_password_length
        redirect_to edit_user_registration_path, notice: resource.errors.full_messages[0]
        puts "--------ERROR from registration_controller - user #{current_user.id}: #{resource.errors.full_messages[0]}"
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

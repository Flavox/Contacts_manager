class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = Contact.order(last_name: :asc)
  end

  def show
  end

  def edit
  end

  def update
    @contact.update(contact_params)
    redirect_to contact_path(@contact)
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, :address, :relations_type, :note)
  end
end

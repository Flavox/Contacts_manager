class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = current_user.contacts.order(:last_name)
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      redirect_to contacts_path, notice: 'Contact created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @contact.update(contact_params)
    redirect_to contact_path(@contact), notice: 'Contact updated'
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path, notice: 'Contact deleted'
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :photo, :phone_number, :address, :birthday, :note, relation_ids: [])
  end
end

class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]
  before_action :check_owner, only: %i[show edit update destroy]

  def index
    @contacts = current_user.contacts.order(:last_name)
    @contacts = @contacts.search_by_name(params[:query]) if params[:query].present?
    respond_to do |format|
      format.html
      format.text { render partial: 'contacts/list', locals: { contacts: @contacts }, formats: [:html] }
    end
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

  def check_owner
    unless @contact.user == current_user
      flash[:alert] = "This contact is not yours."
      redirect_back fallback_location: root_path
    end
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :photo, :phone_number, :address, :birthday, :note, relation_ids: [])
  end
end

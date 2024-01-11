class RelationsController < ApplicationController
  before_action :set_relation, only: %i[show edit update destroy]
  before_action :check_owner, only: %i[show edit update destroy]

  def show
    @contacts = @relation.contacts
    search_module
  end

  def new
    @relation = Relation.new
  end

  def create
    @relation = Relation.new(relation_params)
    @relation.user = current_user
    if @relation.save
      redirect_to edit_user_registration_path, notice: 'Relation created'
    else
      render :new
    end
  end

  def edit
    # @mycontacts = current_user.contacts
    # @contacts_without_relation = @mycontacts.left_outer_joins(:contact_relations).where(contact_relations: { id: nil })
  end

  def update
    @relation.update(relation_params)
    redirect_to edit_user_registration_path, notice: 'Relation updated'
  end

  def destroy
    @relation.destroy
    redirect_to edit_user_registration_path, notice: 'Relation deleted'
  end

  def contacts_without_relation
    @contacts = current_user.contacts
    @contacts = @contacts.left_outer_joins(:contact_relations).where(contact_relations: { id: nil })
    search_module
  end

  private

  def search_module
    @contacts = @contacts.search_by_name(params[:query]) if params[:query].present?
    respond_to do |format|
      format.html
      format.text { render partial: 'contacts/list', locals: { contacts: @contacts }, formats: [:html] }
    end
  end

  def check_owner
    unless @relation.user == current_user
      flash[:alert] = "This relationship is not yours."
      redirect_back fallback_location: root_path
    end
  end

  def set_relation
    @relation = Relation.find(params[:id])
  end

  def relation_params
    params.require(:relation).permit(:relation_type)
  end
end

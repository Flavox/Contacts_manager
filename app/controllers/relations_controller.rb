class RelationsController < ApplicationController
  before_action :set_relation, only: %i[show edit update destroy]

  def index
    @relations = current_user.relations
  end

  def show
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
  end

  def update
    @relation.update(relation_params)
    redirect_to edit_user_registration_path, notice: 'Relation updated'
  end

  def destroy
    @relation.destroy
    redirect_to edit_user_registration_path, notice: 'Relation deleted'
  end

  private

  def set_relation
    @relation = Relation.find(params[:id])
  end

  def relation_params
    params.require(:relation).permit(:relation_type)
  end
end

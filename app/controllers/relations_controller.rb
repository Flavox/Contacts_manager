class RelationsController < ApplicationController

  def index
    @relations = current_user.relations
  end

  def new
    @relation = Relation.new
  end

  def create
    @relation = Relation.new(relation_params)
    @relation.user = current_user
    @relation.save
  end

  private

  def relation_params
    params.require(:relation).permit(:relation_type)
  end
end

class RelationsController < ApplicationController

  def index
    @relations = Relation.all
  end

  def new
    @relation = Relation.new
  end

  def create
    @relation = Relation.new(relation_params)
    @relation.save
  end

  private

  def relation_params
    params.require(:relation).permit(:relation_type)
  end
end

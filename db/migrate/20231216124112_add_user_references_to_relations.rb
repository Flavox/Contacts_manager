class AddUserReferencesToRelations < ActiveRecord::Migration[7.1]
  def change
    add_reference :relations, :user, foreign_key: true, null: false
  end
end

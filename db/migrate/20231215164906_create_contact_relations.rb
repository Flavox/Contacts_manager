class CreateContactRelations < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_relations do |t|
      t.references :contact, null: false, foreign_key: true
      t.references :relation, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.text :address
      t.date :birthday
      t.text :note
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class ChangeColumnNullContacts < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:contacts, :first_name, false)
  end
end

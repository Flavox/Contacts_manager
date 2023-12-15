class ChangeColumnNullRelation < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:relations, :type, false)

  end
end

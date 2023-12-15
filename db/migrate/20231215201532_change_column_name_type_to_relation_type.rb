class ChangeColumnNameTypeToRelationType < ActiveRecord::Migration[7.1]
  def change
    rename_column :relations, :type, :relation_type
  end
end

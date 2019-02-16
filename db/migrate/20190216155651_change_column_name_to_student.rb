class ChangeColumnNameToStudent < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :class, :class_name
  end
end

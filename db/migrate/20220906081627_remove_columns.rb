class RemoveColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :group_id
    remove_column :groups, :expense_id
  end
end

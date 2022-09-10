class DropTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :groups
    drop_table :expenses
  end
end

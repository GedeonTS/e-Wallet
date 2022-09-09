class AddKey2 < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :expenses, :groups
    add_foreign_key :groups, :expenses
  end
end

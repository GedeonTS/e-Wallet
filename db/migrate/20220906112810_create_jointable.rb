class CreateJointable < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.integer :group_id, null: false
      t.integer :expense_id, null: false

      t.timestamps
    end
  end
end

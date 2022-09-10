class CreateExpense < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :amount
      t.integer :group_id
      t.integer :author_id

      t.timestamps
    end
  end
end

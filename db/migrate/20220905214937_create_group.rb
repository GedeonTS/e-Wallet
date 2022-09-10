class CreateGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.integer :expense_id
      t.integer :author_id

      t.timestamps
    end
  end
end

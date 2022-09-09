class AddKey1a < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :expenses, :users
  end
end

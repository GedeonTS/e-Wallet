class AddKey3 < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :groups, :users
  end
end

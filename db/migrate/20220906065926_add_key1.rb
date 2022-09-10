class AddKey1 < ActiveRecord::Migration[7.0]
  def change
    def change
      add_foreign_key :expenses, :users
    end
  end
end

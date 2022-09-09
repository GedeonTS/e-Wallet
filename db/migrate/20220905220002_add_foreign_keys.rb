class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    def self.up
      rename_column :groups, :author_id, :user_id
    end
  
    def self.down
      # rename back if you need or do something else or do nothing
    end
  end
end

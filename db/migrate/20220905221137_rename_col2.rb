class RenameCol2 < ActiveRecord::Migration[7.0]
  def change
    rename_column :groups, :author_id, :user_id

  end
end

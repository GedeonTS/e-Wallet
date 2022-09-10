class AddMails < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mails, :string
  end
end

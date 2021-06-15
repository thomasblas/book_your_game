class AddNicknameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :photo, :string
    add_column :users, :address, :string
  end
end

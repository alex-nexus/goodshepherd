class ChangePasswordColumnToUser < ActiveRecord::Migration
  def up
    change_column :users, :encrypted_password, :string, :null_allowed => true
  end

  def down
  end
end

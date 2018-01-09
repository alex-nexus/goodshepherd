class AddDefaultChurchIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :default_church_id, :integer
  end
end

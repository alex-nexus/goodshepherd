class SetDefaultValues < ActiveRecord::Migration
  def up
    change_column :attendances, :is_active, :boolean, :null => false, :default => true
    change_column :memberships, :is_active, :boolean, :null => false, :default => true
  end

  def down
  end
end

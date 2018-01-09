class RemoveLocalityFromChurch < ActiveRecord::Migration
  def up
    remove_column :churches, :locality
  end

  def down
  end
end

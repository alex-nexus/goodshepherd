class AddDirectoryFileToChurch < ActiveRecord::Migration
  def change
    add_column :churches, :church_directory, :string
  end
end

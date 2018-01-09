class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :meeting_id
      t.boolean :is_active

      t.timestamps
    end
  end
end

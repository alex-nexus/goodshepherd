class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :church_id
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.integer :year
      t.string :location
      t.datetime :start_date
      t.datetime :end_date
      t.string :type
      t.integer :church_id
      t.datetime :registration_deadline
      t.integer :contact_user_id

      t.timestamps
    end
  end
end

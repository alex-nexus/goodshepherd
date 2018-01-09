class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :church_id
      t.boolean :is_active

      t.timestamps
    end
  end
end

class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.string :name
      t.string :description
      t.string :locality
      t.string :city
      t.string :region

      t.timestamps
    end
  end
end

class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :location
      t.string :city
      t.string :state
      t.string :country
      t.integer :zipcode
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.string :description

      t.timestamps
    end
  end
end

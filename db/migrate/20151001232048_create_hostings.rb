class CreateHostings < ActiveRecord::Migration
  def change
    create_table :hostings do |t|
      t.decimal :cover
      t.string :time
      t.string :description

      t.timestamps
    end
  end
end

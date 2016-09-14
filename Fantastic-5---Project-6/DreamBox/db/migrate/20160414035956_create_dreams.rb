class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :description
      t.datetime :start_time

      t.timestamps null: false
    end
  end
end

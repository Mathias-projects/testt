class CreateWorkingHoursTables < ActiveRecord::Migration[6.1]
  def change
    create_table :working_hours_tables do |t|
      t.string :monday, null:false
      t.string :tuesday, null:false
      t.string :wednesday, null:false
      t.string :thursday, null:false
      t.string :friday, null:false
      t.references :user,  null: false, foreign_key: true

      t.timestamps
    end
  end
end

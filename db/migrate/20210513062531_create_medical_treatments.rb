class CreateMedicalTreatments < ActiveRecord::Migration[6.1]
  def change
    create_table :medical_treatments do |t|
      t.string :name
      t.string :data
      t.string :start_time
      t.string :end_time
      t.references :doctor,  null: false, foreign_key: {to_table: :users}
      t.references :patient ,   foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end

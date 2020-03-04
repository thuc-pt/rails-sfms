class CreateTimesheets < ActiveRecord::Migration[5.2]
  def change
    create_table :timesheets do |t|
      t.time :start_at
      t.time :end_at
      t.integer :price
      t.references :sub_pitch, foreign_key: true

      t.timestamps
    end
  end
end

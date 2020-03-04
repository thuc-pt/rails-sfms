class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :phone_number
      t.boolean :is_fixed
      t.text :passing_note
      t.date :date
      t.integer :price
      t.integer :status, default: 0
      t.references :timesheet, foreign_key: true
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true, null: true

      t.timestamps
    end
    add_index :bookings, :status
    add_index :bookings, :created_at
  end
end

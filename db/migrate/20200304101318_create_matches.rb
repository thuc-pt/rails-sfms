class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :category, default: 0
      t.string :ward
      t.string :betting
      t.datetime :time
      t.string :competitor
      t.string :captain_name
      t.string :phone_number
      t.text :invition
      t.integer :status, default: 0
      t.references :level, foreign_key: true
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.references :province, foreign_key: true, null: true
      t.references :district, foreign_key: true, null: true
      t.references :pitch, foreign_key: true

      t.timestamps
    end
    add_index :matches, :category
    add_index :matches, :status
  end
end

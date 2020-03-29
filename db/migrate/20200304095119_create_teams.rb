class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :logo
      t.string :image
      t.integer :average_age, default: 20
      t.string :member
      t.integer :win, default: 0
      t.text :description
      t.references :user, foreign_key: true
      t.references :level, foreign_key: true
      t.references :province, foreign_key: true
      t.references :district, foreign_key: true
      t.references :pitch, foreign_key: true

      t.timestamps
    end
    add_index :teams, :name, unique: true
  end
end

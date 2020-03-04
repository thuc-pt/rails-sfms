class CreateSubPitches < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_pitches do |t|
      t.string :name
      t.boolean :is_new, default: true
      t.text :description
      t.boolean :active
      t.references :pitch, foreign_key: true
      t.references :sub_pitch_type, foreign_key: true

      t.timestamps
    end
  end
end

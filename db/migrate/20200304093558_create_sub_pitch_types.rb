class CreateSubPitchTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_pitch_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :sub_pitch_types, :name, unique: true
  end
end

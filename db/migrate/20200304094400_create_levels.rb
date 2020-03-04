class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :levels, :name, unique: true
  end
end

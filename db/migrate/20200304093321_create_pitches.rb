class CreatePitches < ActiveRecord::Migration[5.2]
  def change
    create_table :pitches do |t|
      t.string :name
      t.string :phone_number
      t.string :image
      t.time :open_at
      t.time :close_at
      t.string :email
      t.string :link_facebook
      t.text :description
      t.boolean :active
      t.string :address
      t.references :user, foreign_key: true
      t.references :province, foreign_key: true
      t.references :district, foreign_key: true

      t.timestamps
    end
  end
end

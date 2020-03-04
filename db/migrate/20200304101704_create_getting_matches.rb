class CreateGettingMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :getting_matches do |t|
      t.text :message
      t.references :match, foreign_key: true
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.references :province, foreign_key: true
      t.references :district, foreign_key: true
      t.references :pitch, foreign_key: true

      t.timestamps
    end
  end
end

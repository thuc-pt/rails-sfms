class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :image
      t.string :tbl_name
      t.integer :tbl_id
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :comments, :created_at
  end
end

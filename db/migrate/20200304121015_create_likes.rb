class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.string :tbl_name
      t.integer :tbl_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

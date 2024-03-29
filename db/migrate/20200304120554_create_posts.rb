class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :image
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
    add_index :posts, :created_at
  end
end

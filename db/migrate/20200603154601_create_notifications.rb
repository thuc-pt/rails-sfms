class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.integer :receiver_id
      t.string :action
      t.boolean :seen

      t.timestamps
    end
  end
end

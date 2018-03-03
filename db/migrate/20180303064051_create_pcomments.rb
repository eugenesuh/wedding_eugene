class CreatePcomments < ActiveRecord::Migration
  def change
    create_table :pcomments do |t|
      t.integer :user_id
      t.integer :photo_id
      t.string :body

      t.timestamps

    end
  end
end

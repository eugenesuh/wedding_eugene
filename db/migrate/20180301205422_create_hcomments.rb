class CreateHcomments < ActiveRecord::Migration
  def change
    create_table :hcomments do |t|
      t.string :body
      t.integer :user_id
      t.integer :hotel_id

      t.timestamps

    end
  end
end

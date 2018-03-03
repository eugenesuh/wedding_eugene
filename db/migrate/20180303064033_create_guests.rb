class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.integer :user_id
      t.integer :age_group
      t.integer :food
      t.string :lastname
      t.string :firstname
      t.string :dietary
      t.string :image

      t.timestamps

    end
  end
end

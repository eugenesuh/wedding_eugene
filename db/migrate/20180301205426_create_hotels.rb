class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :airbnb_ind
      t.integer :user_id
      t.string :zip
      t.string :body

      t.timestamps

    end
  end
end

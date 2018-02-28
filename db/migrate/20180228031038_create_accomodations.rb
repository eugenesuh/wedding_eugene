class CreateAccomodations < ActiveRecord::Migration
  def change
    create_table :accomodations do |t|
      t.string :name
      t.string :category
      t.string :zip
      t.string :body
      t.string :code
      t.integer :user_id

      t.timestamps

    end
  end
end

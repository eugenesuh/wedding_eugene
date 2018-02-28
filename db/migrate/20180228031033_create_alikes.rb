class CreateAlikes < ActiveRecord::Migration
  def change
    create_table :alikes do |t|
      t.integer :user_id
      t.integer :activity_id

      t.timestamps

    end
  end
end

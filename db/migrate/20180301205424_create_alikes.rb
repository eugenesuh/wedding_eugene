class CreateAlikes < ActiveRecord::Migration
  def change
    create_table :alikes do |t|
      t.integer :activity_id
      t.integer :user_id

      t.timestamps

    end
  end
end

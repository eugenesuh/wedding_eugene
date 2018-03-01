class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.string :image

      t.timestamps

    end
  end
end

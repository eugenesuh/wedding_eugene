class CreateAcomments < ActiveRecord::Migration
  def change
    create_table :acomments do |t|
      t.integer :user_id
      t.integer :activity_id
      t.string :body

      t.timestamps

    end
  end
end

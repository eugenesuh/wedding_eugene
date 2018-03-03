class CreateScomments < ActiveRecord::Migration
  def change
    create_table :scomments do |t|
      t.integer :user_id
      t.integer :song_id
      t.string :body

      t.timestamps

    end
  end
end

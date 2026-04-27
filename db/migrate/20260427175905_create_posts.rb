class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.timestamps

      t.string :title
      t.text :body
      t.integer :number_of_likes
      t.integer :number_of_comments
      t.references :author, null: false, foreign_key: { to_table: :users }
    end
  end
end

class CreateCommentLikes < ActiveRecord::Migration[8.1]
  def change
    create_table :comment_likes do |t|
      t.timestamps

      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
    end
  end
end

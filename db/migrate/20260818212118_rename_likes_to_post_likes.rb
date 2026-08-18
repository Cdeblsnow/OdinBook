class RenameLikesToPostLikes < ActiveRecord::Migration[8.1]
  def change
    rename_table :likes, :post_likes
  end
end

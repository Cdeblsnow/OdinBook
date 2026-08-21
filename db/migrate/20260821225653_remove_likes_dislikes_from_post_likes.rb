class RemoveLikesDislikesFromPostLikes < ActiveRecord::Migration[8.1]
  def change
    remove_column :post_likes, :num_likes, :integer
    remove_column :post_likes, :num_dislikes, :integer
  end
end

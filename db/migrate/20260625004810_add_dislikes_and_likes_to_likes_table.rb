class AddDislikesAndLikesToLikesTable < ActiveRecord::Migration[8.1]
  def change
    add_column :likes, :num_likes, :integer, default: 0
    add_column :likes, :num_dislikes, :integer, default: 0
  end
end

class AddLikesAndDislikesToComments < ActiveRecord::Migration[8.1]
  def change
    add_column :comments, :num_of_dislikes, :integer, default: 0
    add_column :comments, :num_of_likes, :integer, default: 0
  end
end

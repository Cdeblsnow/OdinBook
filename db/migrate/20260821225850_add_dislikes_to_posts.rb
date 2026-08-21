class AddDislikesToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :num_of_dislikes, :integer, default: 0
  end
end

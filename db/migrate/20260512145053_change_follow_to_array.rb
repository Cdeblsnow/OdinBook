class ChangeFollowToArray < ActiveRecord::Migration[8.1]
  def change
    remove_column :users, :following, :integer
    remove_column :users, :followed_by, :integer

    add_column :users, :following, :integer, array: true, default: []
    add_column :users, :followed_by, :integer, array: true, default: []
  end
end

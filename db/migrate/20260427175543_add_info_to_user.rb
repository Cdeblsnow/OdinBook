class AddInfoToUser < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :following, :integer
    add_column :users, :followed_by, :integer
  end
end

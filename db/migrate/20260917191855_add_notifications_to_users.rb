class AddNotificationsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :notifications, :string, array: true, default: []
  end
end

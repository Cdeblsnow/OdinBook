class RemoveNumberOfNotificationsFromUsers < ActiveRecord::Migration[8.1]
  def change
    remove_column :users, :number_of_notifications, :integer
  end
end

class AddColumnsToUser < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :follow_request_list, :integer, array: true, default: []
    add_column :users, :number_of_notifications, :integer, default: 0
  end
end

class ChangeFollowToArray < ActiveRecord::Migration[8.1]
  def change

    def up
      execute <<-SQL
        ALTER TABLE users
          ALTER COLUMN following TYPE integer[] USING ARRAY[following]::integer[],
          ALTER COLUMN followed_by TYPE integer[] USING ARRAY[followed_by]::integer[];
      SQL
      change_column_default :users, :following, []
      change_column_default :users, :followed_by, []
    end
    
    def down
      execute <<-SQL
        ALTER TABLE users
          ALTER COLUMN following TYPE integer USING following[1],
          ALTER COLUMN followed_by TYPE integer USING followed_by[1];
      SQL
      change_column_default :users, :following, nil
      change_column_default :users, :followed_by, nil
    end
  end
end

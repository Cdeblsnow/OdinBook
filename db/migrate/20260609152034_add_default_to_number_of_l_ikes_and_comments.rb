class AddDefaultToNumberOfLIkesAndComments < ActiveRecord::Migration[8.1]
  def change
    change_column_default :posts, :number_of_comments, 0
    change_column_default :posts, :number_of_likes, 0
  end
end

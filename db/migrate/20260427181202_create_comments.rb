class CreateComments < ActiveRecord::Migration[8.1]
  def change
    create_table :comments do |t|
      t.timestamps

      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
    end
  end
end

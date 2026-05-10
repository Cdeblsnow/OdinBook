class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :comments, dependent: :destroy

  delegate :user_name, to: :author, prefix: true, allow_nil: true
end

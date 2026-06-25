class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_by, through: :likes, source: :user
  delegate :user_name, to: :author, prefix: true, allow_nil: true

  def number_likes
    likes.last&.num_likes
  end
  def number_dislikes
    likes.last&.num_dislikes
  end
end

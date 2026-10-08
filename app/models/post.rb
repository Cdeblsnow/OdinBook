class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :liked_by, through: :likes, source: :user
  delegate :user_name, to: :author, prefix: true, allow_nil: true
  validates :body, presence: true, length: { minimum: 1 }
  validates :title, presence: true, length: { minimum: 2 }

  def number_likes
    self.number_of_likes
  end
  def number_dislikes
    self.num_of_dislikes
  end
end

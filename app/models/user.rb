class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: "author_id", dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :liked_posts, through: :post_likes, source: :post
  has_many :comments, dependent: :destroy
  has_many :liked_comments, through: :comment_likes, source: :comment

  has_one_attached :image
  def fetch_request_list
    @requesting_users = User.where(id: self.follow_request_list)
    @requesting_users
  end
end

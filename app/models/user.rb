class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: "author_id", dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :liked_posts, through: :post_likes, source: :post
  has_many :comments, dependent: :destroy
  has_many :comment_likes, dependent: :destroy
  has_many :liked_comments, through: :comment_likes, source: :comment

  has_one_attached :image

  def fetch_request_list
    requesting_users = User.where(id: self.follow_request_list)
    requesting_users
  end

  def fetch_notification_list
    notification_arr = []
    self.notifications.each do |n|
      user =[ User.find_by(id: n[0].to_i)&.user_name, n[0].to_i ]
      notification_arr <<  [ [ user, n[1], n[2], n[3].to_i ] ]
    end
    notification_arr
  end


  def add_notification(uid, interaction, type, tid)
    self.notifications << [ uid.to_s, interaction, type, tid.to_s ]
    self.save!
  end
end

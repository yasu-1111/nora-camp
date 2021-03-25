class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # 自分がフォローしている人
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # 自分をフォローしている人
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user_rooms

  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }


  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  def User.search(search, user_or_hashname, how_search)
    if user_or_hashname == "1"
      if how_search == "1"
              User.where(['name LIKE ?', "%#{search}%"])
      elsif how_search == "2"
              User.where(['name LIKE ?', "%#{search}"])
      elsif how_search == "3"
              User.where(['name LIKE ?', "#{search}%"])
      elsif how_search == "4"
              User.where(['name LIKE ?', "#{search}"])
      else
              User.all
      end
    end
  end

end

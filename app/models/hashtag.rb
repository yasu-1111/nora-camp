class Hashtag < ApplicationRecord

  validates :hashname, presence: true, length: { maximum:99}
  has_many :post_hashs
  has_many :posts, through: :post_hashs

end

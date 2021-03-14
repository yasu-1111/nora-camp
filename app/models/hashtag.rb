class Hashtag < ApplicationRecord

  validates :hashname, presence: true, length: { maximum:99}
  has_many :post_hashs
  has_many :posts, through: :post_hashs

  def self.search(search, user_or_hashname, how_search)
      if how_search == "1"
          Hashtag.where(['hashname LIKE ?', "%#{search}%"])
      elsif how_search == "2"
          Hashtag.where(['hashname LIKE ?', "%#{search}"])
      elsif how_search == "3"
          Hashtag.where(['hashname LIKE ?', "#{search}%"])
      elsif how_search == "4"
          Hashtag.where(['hashname LIKE ?', "#{search}"])
      end
  end

end

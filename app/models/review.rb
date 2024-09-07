class Review < ApplicationRecord
   has_one_attached :image
    has_many :comments, dependent: :destroy
   belongs_to :user
   belongs_to :category
   # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @review = Review.where("product_name LIKE?","#{word}")
    elsif search == "forward_match"
      @review= Review.where("product_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @review = Review.where("product_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @review = Review.where("product_name LIKE?","%#{word}%")
    else
      @review = Review.all
    end
  end

end

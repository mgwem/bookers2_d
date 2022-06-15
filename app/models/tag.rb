class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :books, through: :tag_maps

  def self.looks(search, word)
    if search == "perfect_match"
      Tag.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      Tag.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      Tag.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      Tag.where("title LIKE?","%#{word}%")
    end
  end

end

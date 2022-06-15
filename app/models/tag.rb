class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :books, through: :tag_maps

  def self.looks(search, word)
    if search == "perfect_match"
      tags = Tag.where("tag_name LIKE?","#{word}")
    elsif search == "forward_match"
      tags = Tag.where("tag_name LIKE?","#{word}%")
    elsif search == "backward_match"
      tags = Tag.where("tag_name LIKE?","%#{word}")
    elsif search == "partial_match"
      tags = Tag.where("tag_name LIKE?","%#{word}%")
    end
    return tags.inject(init = []) {|result, tag| result + tag.books}
  end

end

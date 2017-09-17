class Tag < ApplicationRecord
  has_many :article_tags
  has_many :articles, through: :article_tags

  validates :name, presence: true, length: { maximum: 255 }

  def self.names_and_ids
    self.all.map do |tag|
      [tag.name, tag.id]
    end
  end
end

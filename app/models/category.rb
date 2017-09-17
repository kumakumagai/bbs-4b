class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  validates :name, presence: true, length: { maximum: 255 }

  def self.names_and_ids
    self.all.map do |category|
      [category.name, category.id]
    end
  end
end

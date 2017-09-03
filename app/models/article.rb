class Article < ApplicationRecord
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :article_comments, dependent: :destroy
  has_many :comments, through: :article_comments

  validates :title, presence: true, length: { maximum: 100  }
  validates :body,  presence: true, length: { maximum: 5000 }
end

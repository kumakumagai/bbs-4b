class ArticleCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category

  validates :article,  presence: true
  validates :category, presence: true
end

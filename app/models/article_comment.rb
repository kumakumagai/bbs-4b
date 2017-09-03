class ArticleComment < ApplicationRecord
  belongs_to :article
  belongs_to :comment

  validates :article, presence: true
  validates :comment, presence: true, uniqueness: true
end

class Comment < ApplicationRecord
  has_one :article_comment, dependent: :destroy
  has_one :article, through: :article_comment
  has_many :comment_assocs
  has_one  :parent_comment, through: :comment_assocs
  has_many :child_comments, through: :comment_assocs

  validates :username, presence: true, length: { maximum: 64   }
  validates :body,     presence: true, length: { maximum: 1000 }
end

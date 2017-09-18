class Comment < ApplicationRecord
  has_one :article_comment, dependent: :destroy
  has_one :article, through: :article_comment
  has_many :parent_assocs,   foreign_key: 'child_id', class_name: 'CommentAssoc'
  has_many :children_assocs, foreign_key: 'parent_id',  class_name: 'CommentAssoc'
  has_one  :parent_comment, through: :parent_assocs, source: :parent_comment
  has_many :child_comments, through: :children_assocs, source: :child_comment

  validates :username, presence: true, length: { maximum: 64   }
  validates :body,     presence: true, length: { maximum: 1000 }
end

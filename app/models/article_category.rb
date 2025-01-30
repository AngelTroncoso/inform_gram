class ArticleCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category

  validates :article, :category, presence: true
end

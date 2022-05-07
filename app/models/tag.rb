class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :articles, through: :tag_articles
  has_many :tag_articles, dependent: :destroy
end

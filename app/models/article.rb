class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  has_many :tag_articles, dependent: :destroy
  has_many :tags, through: :tag_articles
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end

class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user

  has_many :post_categories
  has_many :categories, through: :post_categories
  validates :title, presence: true
  validates :content, presence: true

  has_rich_text :content

  def self.search(keyword)
    where("title like '%#{keyword}%' or content like '%#{keyword}%'")
  end
end

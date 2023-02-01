class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { integer_only: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { integer_only: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter

  def recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end

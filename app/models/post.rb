# == Schema Information
#
# Table name: posts
#
#  id               :bigint           not null, primary key
#  comments_counter :bigint           default(0)
#  cover            :string           default("")
#  likes_counter    :bigint           default(0)
#  text             :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  author_id        :bigint           not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :comments, foreign_key: :post_id, dependent: :destroy
  has_many :likes, foreign_key: :post_id, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { integer_only: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { integer_only: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter
  after_destroy :decrement_posts_counter

  mount_uploader :cover, CoverUploader

  def recent_five_comments
    comments.limit(5).reverse
  end

  private

  def decrement_posts_counter
    author.decrement!(:posts_counter)
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end

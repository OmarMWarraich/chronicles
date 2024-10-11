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
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

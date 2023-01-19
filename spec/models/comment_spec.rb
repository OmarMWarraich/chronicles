require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(name: 'John', posts_counter: 0) }
  let(:post) do
    Post.create!(title: 'Post title', text: 'Post text', author: user, comments_counter: 0, likes_counter: 0)
  end
  let(:comment) do
    Comment.create!(text: 'Comment text', author_id: user.id, post_id: post.id)
  end

  it 'should belong to user' do
    expect(comment.author_id).to eq(user.id)
  end

  it 'should belong to post' do
    expect(comment.post).to eq(post)
  end
end

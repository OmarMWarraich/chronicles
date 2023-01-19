require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: 'John', posts_counter: 0) }
  let(:post) do
    Post.create!(title: 'Post title', text: 'Post text', author: user, comments_counter: 0, likes_counter: 0)
  end

  it 'should have many posts' do
    expect(user.posts).to eq([post])
  end

  it 'should have many comments' do
    expect(user.comments).to eq([])
  end

  it 'should have many likes' do
    expect(user.likes).to eq([])
  end

  it 'should have a name' do
    expect(user.name).to eq('John')
  end

  it 'should have a posts_counter' do
    expect(user.posts_counter).to eq(0)
  end

  it 'should have a recent_three_posts' do
    expect(user.recent_three_posts).to eq([post])
  end
end

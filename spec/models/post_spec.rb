require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create!(name: 'John', posts_counter: 0) }
  let(:post) do
    Post.create!(title: 'Post title', text: 'Post text', author: user, comments_counter: 0, likes_counter: 0)
  end

  it 'should belong to author' do
    expect(post.author).to eq(user)
  end

  it 'should have many comments' do
    expect(post.comments).to eq([])
  end

  it 'should have many likes' do
    expect(post.likes).to eq([])
  end

  it 'should have a title' do
    expect(post.title).to eq('Post title')
  end

  it 'should have a text' do
    expect(post.text).to eq('Post text')
  end

  it 'should have a comments_counter' do
    expect(post.comments_counter).to eq(0)
  end

  it 'should have a likes_counter' do
    expect(post.likes_counter).to eq(0)
  end

  it 'should have a recent_five_comments' do
    expect(post.recent_five_comments).to eq([])
  end

  it 'should have a valid title' do
    expect(post.valid?).to eq(true)
  end
end

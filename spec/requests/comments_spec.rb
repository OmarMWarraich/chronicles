require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  before(:each) do
    @user = User.create(name: 'Remo',
                        photo: 'http://www.awesome.org',
                        bio: 'Teacher.')
    4.times do
      Post.create(author: @user, title: 'hey', text: 'hello world')
    end
  end

  describe 'GET /new' do
    before(:example) do
      @post = @user.posts[0]
      get user_post_path(@user.id, @post.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    before(:example) do
      @post = @user.posts[0]
      get user_post_path(@user.id, @post.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end

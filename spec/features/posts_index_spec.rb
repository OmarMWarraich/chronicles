require 'rails_helper'

RSpec.describe 'PostsShow', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'John', photo: 'https://www.google.com', bio: 'I am user#1', posts_counter: 0)

    @posts = []

    6.times do |i|
      @posts << Post.create(title: "Post##{i + 1}", text: "This is post##{i + 1}", author: @user1)
    end

    @comments = []
    6.times do |i|
      @comments << Comment.create(text: "This is comment##{i + 1}", author: @user1, post: @posts[0])
    end

    @likes = Like.create(author: @user1, post: @posts[0])

    visit user_posts_path(@user1)
  end

  it "should show the user's profile picture" do
    expect(page).to have_content('User Image')
  end

  it "should show the user's name" do
    expect(page).to have_content(@user1.name)
  end

  it 'shows the number of posts for user' do
    expect(page).to have_content(@user1.posts_counter)
  end

  it 'shows the text of the post' do
    expect(page).to have_content(@posts[0].text)
  end

  it 'shows the number of comments for the post' do
    expect(page).to have_content(@posts[0].comments_counter)
  end

  it 'shows the number of likes for the post' do
    expect(page).to have_content(@posts[0].likes_counter)
  end

  it 'shows the pagination section' do
    expect(page).to have_content('Pagination')
  end

  it 'shows the title of the post' do
    expect(page).to have_content(@posts[0].title)
  end

  it 'shows the text of the comment' do
    expect(page).to have_content(@comments[0].text)
  end

  it 'redirects to the post\'s page when the post is clicked' do
    click_link(@posts[0].text)
    expect(page).to have_current_path(user_post_path(@user1, @posts[0]))
  end
end

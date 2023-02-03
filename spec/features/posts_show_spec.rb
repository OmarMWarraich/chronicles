require 'rails_helper'

RSpec.describe 'PostsShow', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'John',
                         photo: 'https://www.google.com',
                         bio: 'I am user#1',
                         posts_counter: 0)

    @post1 = Post.create(title: 'Post#1',
                         text: 'This is post#1',
                         author: @user1,
                         comments_counter: 0,
                         likes_counter: 0)
    10.times do |_i|
      Like.create(author: @user1, post: @post1)
    end

    @comments = []
    6.times do |i|
      @comments << Comment.create(text: "This is comment##{i + 1}",
                                  author: @user1,
                                  post: @post1)
    end
    visit user_post_path(@user1, @post1)
  end

  it "should show the post's title" do
    expect(page).to have_content(@post1.title)
  end

  it "should show the post's author" do
    expect(page).to have_content(@post1.author.name)
  end

  it "should show the post's text" do
    expect(page).to have_content(@post1.text)
  end

  it "should show the post's comments" do
    expect(page).to have_content(@comments[0].text)
    expect(page).to have_content(@comments[1].text)
    expect(page).to have_content(@comments[2].text)
  end

  it "should show the post's comments counter" do
    expect(page).to have_content(@post1.comments_counter)
  end

  it "should show the post's likes counter" do
    expect(page).to have_content(@post1.likes_counter)
  end
end

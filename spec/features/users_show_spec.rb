require 'rails_helper'

RSpec.describe 'UsersShow', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'John',
                         photo: 'https://www.google.com',
                         bio: 'I am user#1',
                         posts_counter: 0)
    @posts = []
    6.times do |i|
      @posts << Post.create(title: "Post##{i + 1}",
                            text: "This is post##{i + 1}",
                            author: @user1)
    end
    visit user_path(@user1)
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

  it "should show the user's bio" do
    expect(page).to have_content(@user1.bio)
  end

  it "should show the user's first three posts" do
    expect(page).to have_content(@posts[0].text)
    expect(page).to have_content(@posts[1].text)
    expect(page).to have_content(@posts[2].text)
  end

  it 'should show a button to see all posts' do
    expect(page).to have_content('See All Posts')
  end

  it "should redirect to the user's posts page when clicking on the button" do
    click_link('See All Posts')
    expect(page).to have_current_path(user_posts_path(@user1))
  end

  it "should redirect to the user's post show page when clicking on the post" do
    click_link(@posts[0].text)
    expect(page).to have_current_path(user_post_path(@user1, @posts[0]))
  end
end

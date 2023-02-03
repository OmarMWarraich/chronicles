require 'rails_helper'
RSpec.describe "UsersShow", type: :feature do
    before(:each) do
        @user1 = User.create(name: "John", photo: "https://www.google.com", bio: "I am user#1", posts_counter: 0)
        @post1 = Post.create(title: "Post#1", text: "This is post#1", author: @user1)
        @post2 = Post.create(title: "Post#2", text: "This is post#2", author: @user1)
        @post3 = Post.create(title: "Post#3", text: "This is post#3", author: @user1)
        @post4 = Post.create(title: "Post#4", text: "This is post#4", author: @user1)
        @post5 = Post.create(title: "Post#5", text: "This is post#5", author: @user1)
        @post6 = Post.create(title: "Post#6", text: "This is post#6", author: @user1)
        visit user_path(@user1)
    end
    it "should show the user's profile picture" do
        expect(page).to have_content("User Image")
    end
    it "should show the user's name" do
        expect(page).to have_content("John")
    end
    it "shows the number of posts for user" do
        expect(page).to have_content("6")
    end
    it "should show the user's bio" do
        expect(page).to have_content("I am user#1")
    end
    it "should show the user's first three posts" do
        expect(page).to have_content("This is post#1")
        expect(page).to have_content("This is post#2")
        expect(page).to have_content("This is post#3")
    end
    it "should show a button to see all posts" do
        expect(page).to have_content("See All Posts")
    end
    it "should redirect to the user's posts page when clicking on the button" do
        click_link("See All Posts")
        expect(page).to have_current_path(user_posts_path(@user1))
    end
    it "should redirect to the user's post show page when clicking on the post" do
        click_link("This is post#1")
        expect(page).to have_current_path(user_post_path(@user1,@post1))
    end
end
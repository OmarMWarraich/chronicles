require 'rails_helper'

RSpec.describe "UsersIndex", type: :feature do

    before(:each) do
        @user1 = User.create(name: "John", photo: "https://www.google.com", bio: "I am user#1", posts_counter: 1)
        @user2 = User.create(name: "Jane", photo: "https://www.google.com", bio: "I am user#2", posts_counter: 2)
        @user3 = User.create(name: "Jack", photo: "https://www.google.com", bio: "I am user#3", posts_counter: 3)
        @user4 = User.create(name: "Jill", photo: "https://www.google.com", bio: "I am user#4", posts_counter: 4)
        visit users_path
    end

    it "should show all users" do
        expect(page).to have_content("John")
        expect(page).to have_content("Jane")
        expect(page).to have_content("Jack")
        expect(page).to have_content("Jill")
    end

    it  "shows the profile picture of all users" do
        expect(page).to have_content("User Image")
    end

    it "shows the number of posts for each user" do
        expect(page).to have_content("1")
        expect(page).to have_content("2")
        expect(page).to have_content("3")
        expect(page).to have_content("4")
    end

    it "should redirect to the John's show page when clicking on the user" do
        click_link("John")
        expect(page).to have_current_path(user_path(@user1))
    end

    it "should redirect to Jane's show page when clicking on the user" do
        click_link("Jane")
        expect(page).to have_current_path(user_path(@user2))
    end

    it "should redirect to Jack's show page when clicking on the user" do
        click_link("Jack")
        expect(page).to have_current_path(user_path(@user3))
    end

    it "should redirect to Jill's show page when clicking on the user" do
        click_link("Jill")
        expect(page).to have_current_path(user_path(@user4))
    end
end


    


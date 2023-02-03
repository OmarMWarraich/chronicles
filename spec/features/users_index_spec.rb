require 'rails_helper'

RSpec.describe 'UsersIndex', type: :feature do
  before(:each) do
    @users = []
    4.times do |i|
      @users << User.create(name: "User##{i + 1}",
                            photo: 'https://www.google.com',
                            bio: "I am user, post##{i + 1}",
                            posts_counter: i + 1)
    end
    visit users_path
  end

  it 'should show all users' do
    expect(page).to have_content(@users[0].name)
    expect(page).to have_content(@users[1].name)
    expect(page).to have_content(@users[2].name)
    expect(page).to have_content(@users[3].name)
  end

  it 'shows the profile picture of all users' do
    expect(page).to have_content('User Image')
  end

  it 'shows the number of posts for each user' do
    expect(page).to have_content(@users[0].posts_counter)
    expect(page).to have_content(@users[1].posts_counter)
    expect(page).to have_content(@users[2].posts_counter)
    expect(page).to have_content(@users[3].posts_counter)
  end

  it 'should redirect to the User1 show page when clicking on the user' do
    click_link(@users[0].name)
    expect(page).to have_current_path(user_path(@users[0]))
  end

  it 'should redirect to User2 show page when clicking on the user' do
    click_link(@users[1].name)
    expect(page).to have_current_path(user_path(@users[1]))
  end

  it 'should redirect to User3 show page when clicking on the user' do
    click_link(@users[2].name)
    expect(page).to have_current_path(user_path(@users[2]))
  end

  it "should redirect to Jill's show page when clicking on the user" do
    click_link(@users[3].name)
    expect(page).to have_current_path(user_path(@users[3]))
  end
end

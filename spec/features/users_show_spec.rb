require 'rails_helper'
RSpec.describe 'UsersShow', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  before do
    driven_by(:rack_test)
  end
  it 'shows the user profile' do
    visit user_path(user)
    expect(page).to have_content(user.name)
  end
  it 'shows the user profile' do
    visit user_path(other_user)
    expect(page).to have_content(other_user.name)
  end
end
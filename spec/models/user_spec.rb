# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  bio                    :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  photo                  :text
#  posts_counter          :bigint           default(0), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string           default("")
#  slug                   :string
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#
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

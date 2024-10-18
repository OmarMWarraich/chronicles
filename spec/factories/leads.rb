# == Schema Information
#
# Table name: leads
#
#  id         :bigint           not null, primary key
#  country    :string
#  device     :string
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :lead do
    name { "MyString" }
    email { "MyString" }
    device { "MyString" }
    country { "MyString" }
  end
end

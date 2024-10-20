# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  product    :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :payment do
    product { "MyString" }
    amount { 1 }
    state { "MyString" }
  end
end

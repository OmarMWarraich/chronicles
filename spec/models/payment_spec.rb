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
require 'rails_helper'

RSpec.describe Payment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

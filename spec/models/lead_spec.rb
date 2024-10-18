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
require 'rails_helper'

RSpec.describe Lead, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

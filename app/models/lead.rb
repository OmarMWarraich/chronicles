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
class Lead < ApplicationRecord
  validates :name, :email, :device, :country, presence: true
  validates :email, uniqueness: true
end

# == Schema Information
#
# Table name: banks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bank < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end

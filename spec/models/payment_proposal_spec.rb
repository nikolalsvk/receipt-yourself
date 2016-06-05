# == Schema Information
#
# Table name: payment_proposals
#
#  id           :integer          not null, primary key
#  payment_date :datetime
#  number       :integer
#  status       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe PaymentProposal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

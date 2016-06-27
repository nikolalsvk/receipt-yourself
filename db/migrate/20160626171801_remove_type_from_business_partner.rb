class RemoveTypeFromBusinessPartner < ActiveRecord::Migration
  def change
    remove_column :business_partners, :type, :integer
  end
end

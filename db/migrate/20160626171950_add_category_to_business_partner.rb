class AddCategoryToBusinessPartner < ActiveRecord::Migration
  def change
    add_column :business_partners, :category, :integer, null: false
  end
end

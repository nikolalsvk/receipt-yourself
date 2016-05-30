class CreateBusinessPartnerAccounts < ActiveRecord::Migration
  def change
    create_table :business_partner_accounts do |t|
      t.integer :number
      t.boolean :activated

      t.timestamps null: false
    end
  end
end

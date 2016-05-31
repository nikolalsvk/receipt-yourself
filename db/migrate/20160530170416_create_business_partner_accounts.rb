class CreateBusinessPartnerAccounts < ActiveRecord::Migration
  def change
    create_table :business_partner_accounts do |t|
      t.string :number, null: false
      t.boolean :activated, default: false

      t.timestamps null: false
    end
  end
end

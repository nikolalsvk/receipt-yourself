class CreateBusinessPartnerAccounts < ActiveRecord::Migration
  def change
    create_table :business_partner_accounts do |t|
      t.string :number, null: false
      t.boolean :activated, default: false

      t.belongs_to :bank, index: true

      t.timestamps null: false
    end
  end
end

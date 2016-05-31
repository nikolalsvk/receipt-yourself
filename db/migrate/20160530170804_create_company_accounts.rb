class CreateCompanyAccounts < ActiveRecord::Migration
  def change
    create_table :company_accounts do |t|
      t.string :number, null: false
      t.integer :currency, null: false

      t.timestamps null: false
    end
  end
end

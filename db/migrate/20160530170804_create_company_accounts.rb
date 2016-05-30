class CreateCompanyAccounts < ActiveRecord::Migration
  def change
    create_table :company_accounts do |t|
      t.integer :number
      t.string :currency

      t.timestamps null: false
    end
  end
end

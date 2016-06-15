class CreateCompanyAccounts < ActiveRecord::Migration
  def change
    create_table :company_accounts do |t|
      t.string :number, null: false
      t.integer :currency, null: false

      t.belongs_to :company, index: true
      t.belongs_to :bank, index: true

      t.timestamps null: false
    end
  end
end

class CreateDailyStatements < ActiveRecord::Migration
  def change
    create_table :daily_statements do |t|
      
      t.string :debtor_account_number, null: false, limit: 18
      t.string :debtor_account_name, null: false
      t.string :debtor_account_city, null: false
      t.string :debtor_model_number, null: false, limit: 2
      t.string :debtor_reference_number, null: false 
      t.string :debtor_payment_purpose, null: false

      t.string :creditor_model_number, null: false, limit:2
      t.string :creditor_reference_number, null: false
      t.string :creditor_account_number, null: false, limit: 18
      
      t.string :approval_reference_number, null: false
      t.string :payment_number, null: false, limit:3
      t.integer :payment_currency, null: false
      t.decimal :transfer_amount, null: false, precision: 15, scale: 4
      t.string :account_city, null: false

      t.datetime :currency_date, null: false
      t.datetime :payment_date, null: false

      t.integer :calculation_method, null: false
      t.integer :priority, null: false
      t.integer :status, null: false
      t.decimal :remaining_amount, null: false, precision: 15, scale: 4

      t.belongs_to :business_partner, index: true

      t.timestamps null: false
    end
  end
end

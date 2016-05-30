class CreateDailyStatements < ActiveRecord::Migration
  def change
    create_table :daily_statements do |t|
      
      t.integer :debtor_account_number
      t.string :debtor_account_name
      t.string :debtor_account_city
      t.integer :debtor_model_number
      t.string :debtor_reference_number
      t.string :debtor_payment_purpose

      t.integer :creditor_model_number
      t.string :creditor_reference_number
      t.integer :creditor_account_number
      
      t.string :approval_reference_number
      t.integer :payment_number
      t.string :payment_currency
      t.decimal :transfer_amount
      t.string :account_city

      t.datetime :currency_date
      t.datetime :payment_date

      t.integer :calculation_method
      t.integer :priority
      t.integer :status
      t.decimal :remaining_amount

      t.timestamps null: false
    end
  end
end

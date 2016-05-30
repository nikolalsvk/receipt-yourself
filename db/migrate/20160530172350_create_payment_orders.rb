class CreatePaymentOrders < ActiveRecord::Migration
  def change
    create_table :payment_orders do |t|
      t.integer :creditor_account_number
      t.string :account_name
      t.string :account_city
      t.integer :payment_method
      t.integer :debtor_model_number
      t.string :debtor_reference_number
      t.string :debtor_payment_purpose

      t.string :approval_reference_number
      t.integer :payment_number
      t.string :payment_currency
      t.decimal :transfer_amount
      t.string :account_city

      t.datetime :currency_date
      t.datetime :payment_date


      t.timestamps null: false
    end
  end
end

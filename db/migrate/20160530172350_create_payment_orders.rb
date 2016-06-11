class CreatePaymentOrders < ActiveRecord::Migration
  def change
    create_table :payment_orders do |t|
      
      t.string :debtor_account_number, null: false, limit: 18
      t.string :debtor_account_name, null: false
      t.string :debtor_account_city, null: false
      t.string :debtor_model_number, null: false, limit: 2
      t.string :debtor_reference_number, null: false 
      t.string :debtor_payment_purpose, null: false


      t.string :creditor_model_number, null: false, limit:2
      t.string :creditor_reference_number, null: false
      t.string :creditor_account_number, null: false, limit: 18

      t.integer :payment_method, null: false
      t.string :approval_reference_number, null: false
      t.string :payment_number, null: false, limit:3
      t.decimal :transfer_amount, null: false, precision: 15, scale: 4

      t.datetime :currency_date, null: false
      t.datetime :payment_date, null: false

      t.string :account_city, null: false

      t.belongs_to :payment_forming, index: true

      t.timestamps null: false
    end
  end
end

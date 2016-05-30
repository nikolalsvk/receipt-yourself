class CreateInputInvoices < ActiveRecord::Migration
  def change
    create_table :input_invoices do |t|
      t.integer :number
      t.decimal :payment_amount
      t.decimal :remaining_amount
      t.datetime :issuance_date
      t.datetime :circulation_date
      t.datetime :payment_deadline

      t.timestamps null: false
    end
  end
end

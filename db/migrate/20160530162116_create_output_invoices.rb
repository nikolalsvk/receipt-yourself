class CreateOutputInvoices < ActiveRecord::Migration
  def change
    create_table :output_invoices do |t|
      t.integer :number
      t.decimal :amount
      t.decimal :remaining_amout
      t.datetime :issuance_date
      t.datetime :circulation_date
      t.datetime :payment_deadline

      t.timestamps null: false
    end
  end
end

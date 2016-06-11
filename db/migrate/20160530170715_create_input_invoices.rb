class CreateInputInvoices < ActiveRecord::Migration
  def change
    create_table :input_invoices do |t|
      t.string :number, null: false
      t.decimal :payment_amount, null: false, precision: 15, scale: 4
      t.decimal :remaining_amount, null: false, precision: 15, scale: 4
      t.datetime :issuance_date, null: false
      t.datetime :circulation_date, null: false
      t.datetime :payment_deadline, null: false

      t.belongs_to :business_partner, index: true
      t.belongs_to :financial_year, index: true

      t.timestamps null: false
    end
  end
end

class CreateOutputInvoices < ActiveRecord::Migration
  def change
    create_table :output_invoices do |t|
      t.string :number, null: false
      t.decimal :payment_amount, null: false, precision: 15, scale: 4
      t.decimal :remaining_amount, null: false, precision: 15, scale: 4
      t.datetime :issuance_date, null: false
      t.datetime :circulation_date, null: false
      t.datetime :payment_deadline, null: false

      t.belongs_to :company, index: true

      t.timestamps null: false
    end
  end
end

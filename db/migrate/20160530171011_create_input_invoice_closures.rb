class CreateInputInvoiceClosures < ActiveRecord::Migration
  def change
    create_table :input_invoice_closures do |t|
      t.datetime :closure_date
      t.decimal :closure_amount

      t.timestamps null: false
    end
  end
end

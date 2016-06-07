class CreatePaymentFormings < ActiveRecord::Migration
  def change
    create_table :payment_formings do |t|
      t.decimal :amount, null: false, precision: 15, scale: 4

      t.timestamps null: false
    end
  end
end

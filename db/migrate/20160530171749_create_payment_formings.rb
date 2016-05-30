class CreatePaymentFormings < ActiveRecord::Migration
  def change
    create_table :payment_formings do |t|
      t.decimal :amount

      t.timestamps null: false
    end
  end
end

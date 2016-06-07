class CreatePaymentProposals < ActiveRecord::Migration
  def change
    create_table :payment_proposals do |t|
      t.datetime :payment_date, null: false
      t.string :number, null: false 
      t.integer :status, null: false

      t.timestamps null: false
    end
  end
end

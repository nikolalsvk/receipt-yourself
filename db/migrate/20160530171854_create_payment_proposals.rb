class CreatePaymentProposals < ActiveRecord::Migration
  def change
    create_table :payment_proposals do |t|
      t.datetime :payment_date
      t.integer :number
      t.integer :status

      t.timestamps null: false
    end
  end
end

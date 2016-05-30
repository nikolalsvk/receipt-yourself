class CreateDailyBankStatements < ActiveRecord::Migration
  def change
    create_table :daily_bank_statements do |t|
      t.integer :number
      t.datetime :statement_date
      t.decimal :previous_amount
      t.decimal :new_amout
      t.decimal :reserved_amount
      t.decimal :total_payment
      t.decimal :total_payout

      t.timestamps null: false
    end
  end
end

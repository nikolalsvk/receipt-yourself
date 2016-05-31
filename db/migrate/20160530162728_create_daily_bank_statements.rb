class CreateDailyBankStatements < ActiveRecord::Migration
  def change
    create_table :daily_bank_statements do |t|
      t.string :number, null: false
      t.datetime :statement_date, null: false
      t.decimal :previous_amount, precision: 15, scale: 4
      t.decimal :new_amout, precision: 15, scale: 4
      t.decimal :reserved_amount, precision: 15, scale: 4
      t.decimal :total_payment, precision: 15, scale: 4
      t.decimal :total_payout, precision: 15, scale: 4

      t.timestamps null: false
    end
  end
end

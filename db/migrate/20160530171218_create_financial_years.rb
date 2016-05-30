class CreateFinancialYears < ActiveRecord::Migration
  def change
    create_table :financial_years do |t|
      t.integer :year
      t.boolean :closed

      t.timestamps null: false
    end
  end
end

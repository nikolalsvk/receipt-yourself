class CreateFinancialYears < ActiveRecord::Migration
  def change
    create_table :financial_years do |t|
      t.string :year, null: false
      t.boolean :closed, default: false

      t.belongs_to :company, index:true

      t.timestamps null: false
    end
  end
end

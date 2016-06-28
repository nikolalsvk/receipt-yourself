class CreateDailyStatementItems < ActiveRecord::Migration
  def change
    create_table :daily_statement_items do |t|

      t.timestamps null: false
    end
  end
end

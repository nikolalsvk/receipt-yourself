class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false

      t.belongs_to :contact_card, index: true

      t.timestamps null: false
    end
  end
end

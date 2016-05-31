class CreateBusinessPartners < ActiveRecord::Migration
  def change
    create_table :business_partners do |t|
      t.string :name, null: false
      t.integer :type, null: false

      t.timestamps null: false
    end
  end
end

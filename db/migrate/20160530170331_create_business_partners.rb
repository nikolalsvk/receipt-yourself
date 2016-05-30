class CreateBusinessPartners < ActiveRecord::Migration
  def change
    create_table :business_partners do |t|
      t.string :name
      t.integer :type

      t.timestamps null: false
    end
  end
end

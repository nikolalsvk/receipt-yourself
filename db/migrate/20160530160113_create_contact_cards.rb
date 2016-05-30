class CreateContactCards < ActiveRecord::Migration
  def change
    create_table :contact_cards do |t|
      t.integer :pib
      t.string :country
      t.string :region
      t.string :city
      t.string :address
      t.string :email
      t.string :website
      t.string :phone
      t.string :fax

      t.timestamps null: false
    end
  end
end

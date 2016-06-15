class CreateContactCards < ActiveRecord::Migration
  def change
    create_table :contact_cards do |t|
      t.string :pib, null: false
      t.string :country, null: false
      t.string :region
      t.string :city, null: false
      t.string :address, null: false
      t.string :email, null: false
      t.string :website, null: false
      t.string :phone, null: false
      t.string :fax

      t.timestamps null: false
    end
  end
end

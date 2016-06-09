class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name, null: false

      t.belongs_to :contact_card, index: true

      t.timestamps null: false
    end
  end
end

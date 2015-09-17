class CreateTravellers < ActiveRecord::Migration
  def change
    create_table :travellers do |t|
      t.string :city
      t.string :date
      t.text :note
      t.boolean :is_public
      t.integer :capacity

      t.timestamps null: false
    end
  end
end

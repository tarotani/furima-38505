class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.references :order,        null: false, foreign_key: true
      t.string     :postalcode,   null: false
      t.integer    :first_add_id, null: false
      t.string     :second_add,   null: false
      t.string     :address,      null: false
      t.string     :building
      t.string     :tel,          null: false
      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,           null: false
      t.text       :text,           null: false
      t.integer    :price,          null: false
      t.integer    :condition_id,   null: false
      t.integer    :postage_id,     null: false
      t.integer    :first_add_id,   null: false
      t.integer    :send_day_id,    null: false
      t.integer    :category_id,    null: false
<<<<<<< Updated upstream
      t.integer    :user,           null: false, foreign_key: true
      
=======
      t.references :user,           null: false, foreign_key: true
>>>>>>> Stashed changes
      t.timestamps
    end
  end
end

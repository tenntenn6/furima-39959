class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|

      t.timestamps
      t.string     :post_code           , null: false
      t.integer    :prefecture_id       , null: false
      t.string     :cities              , null: false
      t.string     :street_address      , null: false
      t.string     :building  
      t.string     :telephone           , null: false
      t.references :order               , null: false   , foreign_key: true
    end
  end
end




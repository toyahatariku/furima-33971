class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user                  ,null: false, default: ""
      t.string     :name                  ,null: false, default: ""
      t.text       :description           ,null: false, default: ""
      t.integer    :category_id           ,null: false, default: ""
      t.integer    :condition_id          ,null: false, default: ""
      t.integer    :shipping_burden_id    ,null: false, default: ""
      t.integer    :prefecture_id         ,null: false, default: ""
      t.integer    :days_to_ship_id       ,null: false, default: ""
      t.integer    :price                 ,null: false, default: ""
      

      t.timestamps
    end
  end
end
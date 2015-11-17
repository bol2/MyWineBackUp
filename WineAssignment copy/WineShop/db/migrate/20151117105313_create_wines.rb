class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :image_url
      t.string :shortDescription
      t.string :bottleSize
      t.decimal :price
      t.string :company
      t.string :longDescription
      t.string :country
      t.string :grape
      t.string :vegetarians
      t.string :title

      t.timestamps null: false
    end
  end
end

class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link_cat
      t.string :image

      t.timestamps null: false
    end
  end
end

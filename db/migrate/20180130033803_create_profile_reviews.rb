class CreateProfileReviews < ActiveRecord::Migration
  def change
    create_table :profile_reviews do |t|
      t.integer :user_id
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :time_zone
      t.string :lat 
      t.string :long
      t.string :gplace_id
      t.string :gcid
      t.string :gfid

      t.timestamps null: false
    end
  end
end

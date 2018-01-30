class CreateProfileLinks < ActiveRecord::Migration
  def change
    create_table :profile_links do |t|
      t.integer :user_id
      t.integer :profile_review_id
      t.integer :link_id
      t.string :link_url

      t.timestamps null: false
    end
  end
end

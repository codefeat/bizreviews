class CreatePoorReviews < ActiveRecord::Migration
  def change
    create_table :poor_reviews do |t|
      t.integer :user_id
      t.integer :invite_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :message
      t.string :ip_address
      t.string :feedback_action
      t.integer :status, default: 0
      t.text :note

      t.timestamps null: false
    end
  end
end

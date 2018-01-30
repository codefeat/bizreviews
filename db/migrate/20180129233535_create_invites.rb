class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.string :fname
      t.string :lname
      t.string :email
      t.string :token

      t.timestamps null: false
    end
  end
end

class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :business_zipcode, :string
    add_column :users, :business_name, :string
    add_column :users, :business_phone, :string
    add_column :users, :business_email, :string
    add_column :users, :business_url, :string
    add_column :users, :image, :string
    add_column :users, :role, :integer, default: 0
  end
end

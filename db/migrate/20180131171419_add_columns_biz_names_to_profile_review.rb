class AddColumnsBizNamesToProfileReview < ActiveRecord::Migration
  def change
    add_column :profile_reviews, :googleBiz_name, :string
    add_column :profile_reviews, :fbBiz_name, :string
    add_column :profile_reviews, :yelpBiz_name, :string
  end
end

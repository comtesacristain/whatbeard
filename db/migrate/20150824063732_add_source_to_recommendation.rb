class AddSourceToRecommendation < ActiveRecord::Migration
  def change
    add_column :recommendations, :source, :string
  end
end

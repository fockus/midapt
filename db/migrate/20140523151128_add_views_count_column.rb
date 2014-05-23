class AddViewsCountColumn < ActiveRecord::Migration
  def self.up
    add_column :minds, :views_count, :integer, default: 0
  end

  def self.down
    remove_column :minds, :views_count
  end
end

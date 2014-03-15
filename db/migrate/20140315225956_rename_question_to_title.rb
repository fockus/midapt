class RenameQuestionToTitle < ActiveRecord::Migration
  def self.up
    rename_column :minds, :question, :title
  end

  def self.down
  end
end

class CreateUserMindMarks < ActiveRecord::Migration
  def change
    create_table :user_mind_marks do |t|
      t.integer :mark
      t.references :user, index: true
      t.references :mind, index: true
      
      t.timestamps
    end
  end
end

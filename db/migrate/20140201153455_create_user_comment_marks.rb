class CreateUserCommentMarks < ActiveRecord::Migration
  def change
    create_table :user_comment_marks do |t|
      t.integer :mark
      t.references :user, index: true
      t.references :comment, index: true
      
      t.timestamps
    end
  end
end

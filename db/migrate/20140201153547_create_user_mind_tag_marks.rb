class CreateUserMindTagMarks < ActiveRecord::Migration
  def change
    create_table :user_mind_tag_marks do |t|
      t.integer :mark
          t.references :user, index: true
          t.references :mind_tag, index: true  

      t.timestamps
    end
  end
end

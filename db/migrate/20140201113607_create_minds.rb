class CreateMinds < ActiveRecord::Migration
  def change
    create_table :minds do |t|
      t.string :question
      t.text :text
      
      t.references :user, index: true  #t.integer :user_id

      t.timestamps
    end
  end
end

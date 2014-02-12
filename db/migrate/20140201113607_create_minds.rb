class CreateMinds < ActiveRecord::Migration
  def change
    create_table :minds do |t|
      t.string :question
      t.text :text
      
      t.references :user, index: true, :null => false

      t.timestamps
    end

    add_foreign_key :minds, :users
  end
end
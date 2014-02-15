class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message, :null => false
      
      t.references :mind, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end

    add_foreign_key :comments, :minds
    add_foreign_key :comments, :users
  end
end

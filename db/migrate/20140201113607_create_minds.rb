class CreateMinds < ActiveRecord::Migration
  def change
    create_table :minds do |t|
      t.string :title
      t.text :text, null: false
      t.references :user, index: true, null: false
      t.timestamps
    end

    add_foreign_key :minds, :users
  end
end

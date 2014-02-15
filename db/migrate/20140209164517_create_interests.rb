class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.float :gravity

      t.references :user, index: true, null: false
      t.references :stream, index: true, null: false

      t.timestamps
    end

    add_foreign_key :interests, :users
    add_foreign_key :interests, :streams
  end
end

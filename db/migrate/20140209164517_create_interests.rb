class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.float :gravity

      t.references :user, index: true
      t.references :stream, index: true

      t.timestamps
    end
  end
end

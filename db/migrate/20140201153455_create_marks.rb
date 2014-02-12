class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :mark

      t.references :user, index: true

      # Полиморфная асссоциация
      #t.integer :markable_id
      #t.string :markable_type
      t.references :markable, polymorphic: true
      
      t.timestamps
    end
  end
end

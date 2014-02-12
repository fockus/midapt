class CreateMindStreams < ActiveRecord::Migration
  def change
    create_table :mind_streams do |t|

    	t.references :mind, index: true, :null => false
    	t.references :stream, index: true, :null => false

      t.timestamps
    end

    add_foreign_key :mind_streams, :minds
    add_foreign_key :mind_streams, :streams
  end
end

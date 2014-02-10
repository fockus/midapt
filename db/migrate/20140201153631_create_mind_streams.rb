class CreateMindStreams < ActiveRecord::Migration
  def change
    create_table :mind_streams do |t|

    	t.references :mind, index: true
    	t.references :streams, index: true

      t.timestamps
    end
  end
end

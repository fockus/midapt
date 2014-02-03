class CreateMindTags < ActiveRecord::Migration
  def change
    create_table :mind_tags do |t|
    	t.references :mind, index: true
    	t.references :tag, index: true

      t.timestamps
    end
  end
end

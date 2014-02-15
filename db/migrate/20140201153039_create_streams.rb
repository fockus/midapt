class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :name, index: true, null: false
      t.timestamps
    end
  end
end

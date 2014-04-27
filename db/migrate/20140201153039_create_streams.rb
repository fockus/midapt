class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :name, index: true, null: false
      t.timestamps
    end

    add_index :streams, :name, :unique => true

  end
end

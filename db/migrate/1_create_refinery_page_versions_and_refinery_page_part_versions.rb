class CreateRefineryPageVersionsAndRefineryPagePartVersions < ActiveRecord::Migration
  def change
    create_table :refinery_page_versions, :force => true do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.datetime :created_at
    end
    add_index :refinery_page_versions, [:item_type, :item_id]

    create_table :refinery_page_part_versions, :force => true do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.datetime :created_at
    end
    add_index :refinery_page_part_versions, [:item_type, :item_id]
  end
end
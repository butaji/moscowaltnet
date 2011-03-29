class CreateSpeeches < ActiveRecord::Migration
  def self.up
    create_table :speeches do |t|
      t.references :user
      t.string :title
      t.text :body
      t.boolean :approved
      t.integer :voices
    
      t.timestamps
    end
  end

  def self.down
    drop_table :speeches
  end
end

class CreateVoices < ActiveRecord::Migration
  def self.up
    create_table :voices do |t|
      t.references :user
      t.references :speech
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :voices
  end
end

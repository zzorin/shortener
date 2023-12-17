class CreateUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :urls do |t|
      t.string :url, null: false
      t.string :short_url, null: false
      t.integer :clicks_counter, null: false, default: 0
      t.timestamps
    end

    add_index :urls, :short_url, unique: true
  end
end


class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :title, null: false
      t.text :link, null: false

      t.timestamps
    end
  end
end

class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :movie, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end

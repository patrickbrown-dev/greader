class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :url
      t.string :title
      t.string :description
      t.datetime :published_at
      t.string :guid
      t.references :feed, foreign_key: true
      t.string :category
      t.string :comments

      t.timestamps
    end
  end
end

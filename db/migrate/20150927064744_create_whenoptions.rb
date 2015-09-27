class CreateWhenoptions < ActiveRecord::Migration
  def change
    create_table :whenoptions do |t|
      t.string :content
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

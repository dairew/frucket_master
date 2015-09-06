class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.references :bucket, index: true

      t.timestamps
    end
  end
end

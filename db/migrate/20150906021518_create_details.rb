class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end

class CreateComplains < ActiveRecord::Migration[8.0]
  def change
    create_table :complains do |t|
      t.string :title
      t.text :details
      t.string :source

      t.timestamps
    end
  end
end

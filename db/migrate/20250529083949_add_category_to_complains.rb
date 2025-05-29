class AddCategoryToComplains < ActiveRecord::Migration[8.0]
  def change
    add_reference :complains, :category, foreign_key: true
  end
end

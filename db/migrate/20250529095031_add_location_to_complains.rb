class AddLocationToComplains < ActiveRecord::Migration[8.0]
  def change
    add_column :complains, :location, :string
  end
end

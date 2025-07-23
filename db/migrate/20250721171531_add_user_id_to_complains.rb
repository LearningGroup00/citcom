class AddUserIdToComplains < ActiveRecord::Migration[8.0]
  def change
    add_reference :complains, :user, foreign_key: true
  end
end

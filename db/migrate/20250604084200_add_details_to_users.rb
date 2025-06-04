class AddDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :ward, :string
    add_column :users, :post_office, :string
    add_column :users, :upazila, :string
    add_column :users, :district, :string
    add_column :users, :contact_number, :string
    add_column :users, :user_type, :string
  end
end

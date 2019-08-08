class AddColumnTableUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :description, :text
  	add_column :users, :email, :string
  	add_column :users, :age, :integer
  end
end

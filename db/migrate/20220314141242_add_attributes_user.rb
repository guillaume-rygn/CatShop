class AddAttributesUser < ActiveRecord::Migration[5.2]
  def change

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :adress, :string
    add_column :users, :zipcode, :string

  end
end

class AddCountryToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :country, :string
  end
end

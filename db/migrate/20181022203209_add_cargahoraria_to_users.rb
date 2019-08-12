class AddCargahorariaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cargahoraria, :string
  end
end

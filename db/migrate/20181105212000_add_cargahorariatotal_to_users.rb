class AddCargahorariatotalToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cargahoraria_total, :string
  end
end

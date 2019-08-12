class AddCamposToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nome, :string, null: false
    add_column :users, :matricula, :string, null: false
    add_column :users, :licenciatura, :string, null: false
    add_column :users, :inicio_ano, :string, null: false
    add_column :users, :termino_ano, :string, null: false
    add_column :users, :role, :integer, :default => 0
    add_column :users, :inicio_semestre, :string
    add_column :users, :termino_semestre, :string
  end
end

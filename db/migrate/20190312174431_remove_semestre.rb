class RemoveSemestre < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :inicio_semestre, :string
    remove_column :users, :termino_semestre, :string
  end
end

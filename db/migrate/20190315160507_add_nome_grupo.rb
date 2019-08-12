class AddNomeGrupo < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :nome_grupo, :string
  end
end

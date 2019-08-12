class AddNomeUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :nome_usuario, :string
  end
end

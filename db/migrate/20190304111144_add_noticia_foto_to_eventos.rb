class AddNoticiaFotoToEventos < ActiveRecord::Migration[5.2]
  def change
    add_column :eventos, :noticia_foto, :string
  end
end

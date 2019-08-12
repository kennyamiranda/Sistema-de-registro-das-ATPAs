class AddRespostaToDuvidas < ActiveRecord::Migration[5.2]
  def change
    add_column :duvidas, :resposta, :string
  end
end

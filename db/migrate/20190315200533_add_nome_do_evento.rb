class AddNomeDoEvento < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :nome_do_evento, :string
  end
end

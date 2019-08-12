class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :grupo, null: false
      t.date :data_evento, null: false
      t.string :tipo
      t.string :titulo, null: false
      t.string :local_realizacao_atividade, null: false
      t.text :relatorio, null: false
      t.references :user, foreign_key: true
      t.float :hora_computada, null: false
      t.timestamps
    end
  end
end

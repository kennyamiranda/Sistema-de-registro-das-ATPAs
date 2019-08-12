class CreateDuvidas < ActiveRecord::Migration[5.2]
  def change
    create_table :duvidas do |t|
      t.string :duvida
    end
  end
end

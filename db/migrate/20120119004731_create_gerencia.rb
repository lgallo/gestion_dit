class CreateGerencia < ActiveRecord::Migration
  def change
    create_table :gerencia do |t|
      t.string :nombre

      t.timestamps
    end
  end
end

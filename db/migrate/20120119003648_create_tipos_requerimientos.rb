class CreateTiposRequerimientos < ActiveRecord::Migration
  def change
    create_table :tipos_requerimientos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end

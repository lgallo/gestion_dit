class AddCargaPlanificacionToUsuarios < ActiveRecord::Migration
  def change
    change_table :usuarios do |t|
      t.boolean :carga_planificacion
    end
  end
end

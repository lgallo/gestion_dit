class CreatePlanificacionesRequerimientos < ActiveRecord::Migration
  def change
    create_table :planificaciones_requerimientos do |t|
      t.references :planificacion
      t.references :requerimiento
      t.integer :dedicacion_mes

      t.timestamps
    end
    add_index :planificaciones_requerimientos, :planificacion_id
    add_index :planificaciones_requerimientos, :requerimiento_id
  end
end

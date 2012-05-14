class CreatePlanificacionesSemanales < ActiveRecord::Migration
  def change
    create_table :planificaciones_semanales do |t|
      t.references :usuario
      t.references :semana
      t.text :tareas_planificadas
      t.text :tareas_realizadas

      t.timestamps
    end
    add_index :planificaciones_semanales, :usuario_id
    add_index :planificaciones_semanales, :semana_id
  end
end

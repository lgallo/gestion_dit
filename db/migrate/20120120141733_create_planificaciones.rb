class CreatePlanificaciones < ActiveRecord::Migration
  def change
    create_table :planificaciones do |t|
      t.integer :mes
      t.integer :anio
      t.integer :cantidad_personas
      t.integer :dias_mes
      t.decimal :coeficiente_ajuste
      t.integer :dias_totales
      t.references :area

      t.timestamps
    end
    add_index :planificaciones, :area_id
  end
end

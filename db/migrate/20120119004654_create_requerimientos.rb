class CreateRequerimientos < ActiveRecord::Migration
  def change
    create_table :requerimientos do |t|
      t.integer :numero
      t.string :descripcion
      t.references :tipo_requerimiento
      t.references :aplicacion
      t.integer :usuario_solicitante
      t.references :area
      t.date :fecha_fin_estimada
      t.integer :lider_desarrollo
      t.integer :dias_estimados

      t.timestamps
    end
    add_index :requerimientos, :tipo_requerimiento_id
    add_index :requerimientos, :aplicacion_id
    add_index :requerimientos, :usuario_solicitante
    add_index :requerimientos, :area_id
    add_index :requerimientos, :lider_desarrollo
  end
end

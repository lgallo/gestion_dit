class CreateRequerimientosAreas < ActiveRecord::Migration
  def change
    create_table :requerimientos_areas do |t|
      t.references :area
      t.references :requerimiento
      t.decimal :estimacion

      t.timestamps
    end
    add_index :requerimientos_areas, :area_id
    add_index :requerimientos_areas, :requerimiento_id
  end
end

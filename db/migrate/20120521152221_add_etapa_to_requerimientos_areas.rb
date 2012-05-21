class AddEtapaToRequerimientosAreas < ActiveRecord::Migration
  def change
    add_column :requerimientos_areas, :etapa, :string
  end
end

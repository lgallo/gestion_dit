class AddObservacionesToPlanificacion < ActiveRecord::Migration
  def change
    add_column :planificaciones, :observaciones, :string
  end
end

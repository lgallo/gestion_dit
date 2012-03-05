class AddObservacionesToRequerimiento < ActiveRecord::Migration
  def change
    change_table :requerimientos do |t|
      t.string :observaciones
    end
  end
end

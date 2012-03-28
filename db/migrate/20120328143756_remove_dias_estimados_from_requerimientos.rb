class RemoveDiasEstimadosFromRequerimientos < ActiveRecord::Migration
  def change
    change_table :requerimientos do |t|
      t.remove :dias_estimados
    end
  end
end

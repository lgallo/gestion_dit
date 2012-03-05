class AddEstadoToRequerimiento < ActiveRecord::Migration
  def change
    change_table :requerimientos do |t|
      t.references :estado
    end
    add_index :requerimientos, :estado_id      
  end
end

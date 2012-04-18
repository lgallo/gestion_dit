class AddFechaImplementacionToRequerimientos < ActiveRecord::Migration
  def change
    change_table :requerimientos do |t|
      t.date :fecha_implementacion
    end
  end
end

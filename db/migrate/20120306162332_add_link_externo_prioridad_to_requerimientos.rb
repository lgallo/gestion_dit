class AddLinkExternoPrioridadToRequerimientos < ActiveRecord::Migration
  def change
    change_table :requerimientos do |t|
      t.string :link_externo
      t.integer :prioridad
    end
  end
end

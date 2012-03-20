class ChangeObservacionesOnRequerimientos < ActiveRecord::Migration
  def up
    change_column :requerimientos, :observaciones, :text, :limit => nil
  end

  def down
    change_column :requerimientos, :observaciones, :string, :limit => 255
  end
end

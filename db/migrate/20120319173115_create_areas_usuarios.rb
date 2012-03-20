class CreateAreasUsuarios < ActiveRecord::Migration
  def change
    create_table :areas_usuarios do |t|
      t.references :area
      t.references :usuario

      t.timestamps
    end
    add_index :areas_usuarios, :area_id
    add_index :areas_usuarios, :usuario_id
  end
end

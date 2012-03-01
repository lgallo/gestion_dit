# == Schema Information
#
# Table name: requerimientos
#
#  id                    :integer         not null, primary key
#  numero                :integer
#  descripcion           :string(255)
#  tipo_requerimiento_id :integer
#  aplicacion_id         :integer
#  usuario_solicitante   :integer
#  area_id               :integer
#  fecha_fin_estimada    :date
#  lider_desarrollo      :integer
#  dias_estimados        :integer
#  created_at            :datetime
#  updated_at            :datetime
#

class Requerimiento < ActiveRecord::Base
  belongs_to :tipo_requerimiento
  belongs_to :aplicacion
  belongs_to :usuario, :foreign_key => "usuario_solicitante"
  belongs_to :area
  belongs_to :usuario, :foreign_key => "lider_desarrollo"
end

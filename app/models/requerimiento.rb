class Requerimiento < ActiveRecord::Base
  belongs_to :tipo_requerimiento
  belongs_to :aplicacion
  belongs_to :usuario, :foreign_key => "usuario_solicitante"
  belongs_to :area
  belongs_to :usuario, :foreign_key => "lider_desarrollo"
end

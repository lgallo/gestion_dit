# == Schema Information
#
# Table name: planificaciones_requerimientos
#
#  id               :integer         primary key
#  planificacion_id :integer
#  requerimiento_id :integer
#  dedicacion_mes   :integer
#  created_at       :timestamp
#  updated_at       :timestamp
#

class PlanificacionRequerimiento < ActiveRecord::Base
  belongs_to :planificacion
  belongs_to :requerimiento
  
  def dedicacion_previa
    dias_previos = 0
    otros = PlanificacionRequerimiento.find(:all, :conditions => { :requerimiento_id => self.requerimiento_id } )
    otros.each do |pr|
      dias_previos += pr.dedicacion_mes if pr.planificacion.previa? self.planificacion
    end
    dias_previos
  end
  
  def dedicacion_restante
    self.requerimiento.dias_estimados - self.dedicacion_previa
  end
end

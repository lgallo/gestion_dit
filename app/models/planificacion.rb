# == Schema Information
#
# Table name: planificaciones
#
#  id                 :integer         primary key
#  mes                :integer
#  anio               :integer
#  cantidad_personas  :integer
#  dias_mes           :integer
#  coeficiente_ajuste :decimal(, )
#  dias_totales       :integer
#  area_id            :integer
#  created_at         :timestamp
#  updated_at         :timestamp
#

class Planificacion < ActiveRecord::Base
  belongs_to :area
  has_many :planificaciones_requerimientos, :class_name => "PlanificacionRequerimiento"

  def dias_asignados
    asignados = 0
    self.planificaciones_requerimientos.each do |pr|
      asignados += pr.dedicacion_mes
    end
    asignados
  end

  def dias_disponibles
    disponibles = self.dias_totales
  end

  def previa? (otra_planif)
    self.anio < otra_planif.anio or (self.anio == otra_planif.anio and self.mes < otra_planif.mes)
  end
  
  def descripcion
    "#{self.area.nombre} / #{MESES[self.mes-1][0]}-#{self.anio}"
  end
end

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

  def self.filtrar_por_periodo(periodo, area_id)
    hoy = Date.today
    
    case periodo
      when 'este_mes'
        sql_periodo = " mes = #{hoy.month} and anio = #{hoy.year} "
      when 'mes_y_prox'
        sql_periodo = " (mes = #{hoy.month} or mes = #{hoy.month + 1}) and anio = #{hoy.year} "
      when 'todo_el_anio'
        sql_periodo = " anio = #{hoy.year} "
      else
        sql_periodo = ""
    end
    
    unless area_id.nil? or area_id.empty?
      sql_area = (sql_periodo.nil? or sql_periodo.empty? ? "": " and ") + " area_id = #{area_id} "
    else
      sql_area = ""
    end
    
    Planificacion.where("#{sql_periodo} #{sql_area}")
  end

  def dias_asignados
    asignados = 0
    self.planificaciones_requerimientos.each do |pr|
      asignados += pr.dedicacion_mes unless pr.dedicacion_mes.nil?
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

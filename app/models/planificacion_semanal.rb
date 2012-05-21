# == Schema Information
#
# Table name: planificaciones_semanales
#
#  id                  :integer         primary key
#  usuario_id          :integer
#  semana_id           :integer
#  tareas_planificadas :text
#  tareas_realizadas   :text
#  created_at          :timestamp
#  updated_at          :timestamp
#

class PlanificacionSemanal < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :semana
end

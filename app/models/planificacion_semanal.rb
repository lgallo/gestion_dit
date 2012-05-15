# == Schema Information
#
# Table name: planificaciones_semanales
#
#  id                  :integer         not null, primary key
#  usuario_id          :integer
#  semana_id           :integer
#  tareas_planificadas :text
#  tareas_realizadas   :text
#  created_at          :datetime
#  updated_at          :datetime
#

class PlanificacionSemanal < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :semana
end

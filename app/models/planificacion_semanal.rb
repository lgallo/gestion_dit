class PlanificacionSemanal < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :semana
end

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

require 'test_helper'

class PlanificacionSemanalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

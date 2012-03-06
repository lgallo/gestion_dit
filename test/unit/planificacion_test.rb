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

require 'test_helper'

class PlanificacionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

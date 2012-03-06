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

require 'test_helper'

class PlanificacionRequerimientoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

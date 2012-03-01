# == Schema Information
#
# Table name: planificaciones_requerimientos
#
#  id               :integer         not null, primary key
#  planificacion_id :integer
#  requerimiento_id :integer
#  dedicacion_mes   :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class PlanificacionRequerimientoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

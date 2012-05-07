# == Schema Information
#
# Table name: requerimientos
#
#  id                    :integer         primary key
#  numero                :integer
#  descripcion           :string(255)
#  tipo_requerimiento_id :integer
#  aplicacion_id         :integer
#  usuario_solicitante   :integer
#  area_id               :integer
#  fecha_fin_estimada    :date
#  lider_desarrollo      :integer
#  created_at            :timestamp
#  updated_at            :timestamp
#  observaciones         :text
#  estado_id             :integer
#  link_externo          :string(255)
#  prioridad             :integer
#  fecha_implementacion  :date
#

require 'test_helper'

class RequerimientoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

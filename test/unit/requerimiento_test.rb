# == Schema Information
#
# Table name: requerimientos
#
#  id                    :integer         not null, primary key
#  numero                :integer
#  descripcion           :string(255)
#  tipo_requerimiento_id :integer
#  aplicacion_id         :integer
#  usuario_solicitante   :integer
#  area_id               :integer
#  fecha_fin_estimada    :date
#  lider_desarrollo      :integer
#  created_at            :datetime
#  updated_at            :datetime
#  observaciones         :text
#  estado_id             :integer
#  link_externo          :string(255)
#  prioridad             :integer
#

require 'test_helper'

class RequerimientoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

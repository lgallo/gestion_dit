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
#  dias_estimados        :integer
#  created_at            :datetime
#  updated_at            :datetime
#

require 'test_helper'

class RequerimientoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

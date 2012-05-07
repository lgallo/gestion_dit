# == Schema Information
#
# Table name: usuarios
#
#  id                  :integer         primary key
#  nombre              :string(255)
#  apellido            :string(255)
#  login               :string(255)
#  created_at          :timestamp
#  updated_at          :timestamp
#  carga_planificacion :boolean
#

require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: areas_usuarios
#
#  id         :integer         primary key
#  area_id    :integer
#  usuario_id :integer
#  created_at :timestamp
#  updated_at :timestamp
#

class AreaUsuario < ActiveRecord::Base
  belongs_to :area
  belongs_to :usuario
end

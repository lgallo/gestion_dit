# == Schema Information
#
# Table name: tipos_requerimientos
#
#  id         :integer         primary key
#  nombre     :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

class TipoRequerimiento < ActiveRecord::Base
  validates :nombre, :presence => :true
end

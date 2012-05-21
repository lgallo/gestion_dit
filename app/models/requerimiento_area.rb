# == Schema Information
#
# Table name: requerimientos_areas
#
#  id               :integer         primary key
#  area_id          :integer
#  requerimiento_id :integer
#  estimacion       :decimal(, )
#  created_at       :timestamp
#  updated_at       :timestamp
#  etapa            :string(255)
#

class RequerimientoArea < ActiveRecord::Base
  belongs_to :area
  belongs_to :requerimiento
end

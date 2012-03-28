# == Schema Information
#
# Table name: requerimientos_areas
#
#  id               :integer         not null, primary key
#  area_id          :integer
#  requerimiento_id :integer
#  estimacion       :decimal(, )
#  created_at       :datetime
#  updated_at       :datetime
#

class RequerimientoArea < ActiveRecord::Base
  belongs_to :area
  belongs_to :requerimiento
end

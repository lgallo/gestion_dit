# == Schema Information
#
# Table name: tipos_requerimientos
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TipoRequerimiento < ActiveRecord::Base
  validates :nombre, :presence => :true
end

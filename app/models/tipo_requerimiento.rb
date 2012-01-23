class TipoRequerimiento < ActiveRecord::Base
  validates :nombre, :presence => :true
end

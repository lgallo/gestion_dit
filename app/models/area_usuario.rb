class AreaUsuario < ActiveRecord::Base
  belongs_to :area
  belongs_to :usuario
end

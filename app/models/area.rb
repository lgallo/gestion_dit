# == Schema Information
#
# Table name: areas
#
#  id         :integer         primary key
#  nombre     :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

class Area < ActiveRecord::Base
  has_many :areas_usuarios, :class_name => "AreaUsuario"
  
  def texto_miembros
    texto = ""
    
    unless self.areas_usuarios.blank?
      self.areas_usuarios.each do |au|
        texto += ", " unless texto.empty?
        texto += au.usuario.login
      end
    end
    
    texto
  end
end

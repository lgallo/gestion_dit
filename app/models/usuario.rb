# == Schema Information
#
# Table name: usuarios
#
#  id         :integer         primary key
#  nombre     :string(255)
#  apellido   :string(255)
#  login      :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

class Usuario < ActiveRecord::Base
end

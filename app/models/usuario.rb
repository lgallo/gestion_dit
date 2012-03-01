# == Schema Information
#
# Table name: usuarios
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  apellido   :string(255)
#  login      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Usuario < ActiveRecord::Base
end

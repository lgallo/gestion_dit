# == Schema Information
#
# Table name: aplicaciones
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Aplicacion < ActiveRecord::Base
end

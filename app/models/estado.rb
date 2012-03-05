# == Schema Information
#
# Table name: estados
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Estado < ActiveRecord::Base
end

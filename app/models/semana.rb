# == Schema Information
#
# Table name: semanas
#
#  id         :integer         not null, primary key
#  desde      :date
#  hasta      :date
#  created_at :datetime
#  updated_at :datetime
#

class Semana < ActiveRecord::Base

  # Crea todas las semanas del mes, de lunes a viernes
  def self.crear_semanas_mes(fecha)
    unless Semana.tiene_semanas_mes_creadas?(fecha)
      pibote = fecha.at_beginning_of_month
      
      until pibote.month == fecha.next_month.month do
        desde = pibote.next_monday
        hasta = desde.next_friday
        
        Semana.create(:desde => desde, :hasta => hasta) # Creo la semana

        pibote = hasta.next_monday
      end
    end
  end
  
  def self.tiene_semanas_mes_creadas?(fecha)
    principio_mes = fecha.at_beginning_of_month
    fin_mes = fecha.at_end_of_month
    
    Semana.exists?([" desde between :principio and :fin and hasta between :principio and :fin ", {:principio => principio_mes, :fin => fin_mes}])
  end

end

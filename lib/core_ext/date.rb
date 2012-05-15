class Date
  def next_monday
    aux = self
    aux = aux.next_day until aux.monday?
    aux
  end
  
  def next_friday
    aux = self
    aux = aux.next_day until aux.friday?
    aux
  end
end
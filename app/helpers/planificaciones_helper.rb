module PlanificacionesHelper
  def select_anios(form_builder, campo)
    form_builder.select campo, ANIOS
  end
  
  def estado(totales, asignados, disponibles)
    if disponibles > 0
      "subplanificado"
    elsif asignados > totales
      "sobreplanificado"
    else
      "planif_completa"
    end
  end
end

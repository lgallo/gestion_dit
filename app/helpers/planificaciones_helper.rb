module PlanificacionesHelper
  def select_anios(form_builder, campo)
    form_builder.select campo, ANIOS
  end
end

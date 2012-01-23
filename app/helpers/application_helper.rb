module ApplicationHelper
  def select_meses(form_builder, campo)
    form_builder.select campo, MESES
  end
end

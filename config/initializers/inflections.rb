# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
  inflect.irregular 'tipo_requerimiento', 'tipos_requerimientos'
  inflect.irregular 'aplicacion', 'aplicaciones'
  inflect.irregular 'planificacion', 'planificaciones'
  inflect.irregular 'planificacion_requerimiento', 'planificaciones_requerimientos'
  inflect.irregular 'area_usuario', 'areas_usuarios'
end
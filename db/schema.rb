# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120507132837) do

  create_table "aplicaciones", :force => true do |t|
    t.string    "nombre"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "areas", :force => true do |t|
    t.string    "nombre"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "areas_usuarios", :force => true do |t|
    t.integer   "area_id"
    t.integer   "usuario_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "areas_usuarios", ["area_id"], :name => "index_areas_usuarios_on_area_id"
  add_index "areas_usuarios", ["usuario_id"], :name => "index_areas_usuarios_on_usuario_id"

  create_table "estados", :force => true do |t|
    t.string    "nombre"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "gerencia", :force => true do |t|
    t.string    "nombre"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "planificaciones", :force => true do |t|
    t.integer   "mes"
    t.integer   "anio"
    t.integer   "cantidad_personas"
    t.integer   "dias_mes"
    t.decimal   "coeficiente_ajuste"
    t.integer   "dias_totales"
    t.integer   "area_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "planificaciones", ["area_id"], :name => "index_planificaciones_on_area_id"

  create_table "planificaciones_requerimientos", :force => true do |t|
    t.integer   "planificacion_id"
    t.integer   "requerimiento_id"
    t.integer   "dedicacion_mes"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "planificaciones_requerimientos", ["planificacion_id"], :name => "index_planificaciones_requerimientos_on_planificacion_id"
  add_index "planificaciones_requerimientos", ["requerimiento_id"], :name => "index_planificaciones_requerimientos_on_requerimiento_id"

  create_table "requerimientos", :force => true do |t|
    t.integer   "numero"
    t.string    "descripcion"
    t.integer   "tipo_requerimiento_id"
    t.integer   "aplicacion_id"
    t.integer   "usuario_solicitante"
    t.integer   "area_id"
    t.date      "fecha_fin_estimada"
    t.integer   "lider_desarrollo"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.text      "observaciones"
    t.integer   "estado_id"
    t.string    "link_externo"
    t.integer   "prioridad"
    t.date      "fecha_implementacion"
  end

  add_index "requerimientos", ["aplicacion_id"], :name => "index_requerimientos_on_aplicacion_id"
  add_index "requerimientos", ["area_id"], :name => "index_requerimientos_on_area_id"
  add_index "requerimientos", ["estado_id"], :name => "index_requerimientos_on_estado_id"
  add_index "requerimientos", ["lider_desarrollo"], :name => "index_requerimientos_on_lider_desarrollo"
  add_index "requerimientos", ["tipo_requerimiento_id"], :name => "index_requerimientos_on_tipo_requerimiento_id"
  add_index "requerimientos", ["usuario_solicitante"], :name => "index_requerimientos_on_usuario_solicitante"

  create_table "requerimientos_areas", :force => true do |t|
    t.integer   "area_id"
    t.integer   "requerimiento_id"
    t.decimal   "estimacion"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "requerimientos_areas", ["area_id"], :name => "index_requerimientos_areas_on_area_id"
  add_index "requerimientos_areas", ["requerimiento_id"], :name => "index_requerimientos_areas_on_requerimiento_id"

  create_table "tipos_requerimientos", :force => true do |t|
    t.string    "nombre"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string    "nombre"
    t.string    "apellido"
    t.string    "login"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.boolean   "carga_planificacion"
  end

end

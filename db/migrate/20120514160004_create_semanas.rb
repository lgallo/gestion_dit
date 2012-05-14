class CreateSemanas < ActiveRecord::Migration
  def change
    create_table :semanas do |t|
      t.date :desde
      t.date :hasta

      t.timestamps
    end
  end
end

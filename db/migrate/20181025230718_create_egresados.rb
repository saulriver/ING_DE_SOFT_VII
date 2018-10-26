class CreateEgresados < ActiveRecord::Migration[5.2]
  def change
    create_table :egresados do |t|
      t.string :nombre
      t.string :apellidos
      t.date :ingreso
      t.date :egreso
      t.string :contingente
      t.references :facultad, foreign_key: true
      t.references :programa, foreign_key: true
      t.string :telefono
      t.string :correo
      t.string :direccion

      t.timestamps
    end
  end
end

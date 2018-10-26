class AddFacultadRefToProgramas < ActiveRecord::Migration[5.2]
  def change
    add_reference :programas, :facultad, foreign_key: true
  end
end

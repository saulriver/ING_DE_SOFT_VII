class Egresado < ApplicationRecord
  belongs_to :facultad
  belongs_to :programa
  
validates :nombre, :presence => true
validates :apellidos, :presence => true
validates :contingente, :presence => true
validates :correo, :presence => true

end

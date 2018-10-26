class Facultad < ApplicationRecord
  has_many :programas
  has_many :egresados

  validates :nombre, :presence => true
  validates :decano, :presence => true
  
end

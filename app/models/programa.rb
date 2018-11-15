class Programa < ApplicationRecord
  belongs_to :facultad
  has_many :egresados
  validates :codigo, :presence => true
  validates :nombre, :presence => true

  paginates_per 3
end

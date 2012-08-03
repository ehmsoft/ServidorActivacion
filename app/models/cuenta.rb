class Cuenta < ActiveRecord::Base
  attr_accessible :aplicacion_id, :correo, :pendiente, :total
  belongs_to :aplicacion
  has_many :registros
end
class Cuenta < ActiveRecord::Base
  attr_accessible :aplicacion_id, :correo, :pendiente, :total
  belongs_to :aplicaciones
  has_many :registros
end

class Aplicacion < ActiveRecord::Base
  attr_accessible :nombre
  has_many :cuentas
end

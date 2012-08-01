class Registro < ActiveRecord::Base
  attr_accessible :cuenta_id, :hora, :pendiente, :total
  belongs_to :cuenta
end

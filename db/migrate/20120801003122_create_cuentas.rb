class CreateCuentas < ActiveRecord::Migration
  def change
    create_table :cuentas do |t|
      t.string :correo
      t.integer :pendiente
      t.integer :total
      t.integer :aplicacion_id

      t.timestamps
    end
    add_index :cuentas, :correo
    add_index :cuentas, :aplicacion_id
  end
end

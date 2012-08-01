class CreateRegistros < ActiveRecord::Migration
  def change
    create_table :registros do |t|
      t.integer :cuenta_id
      t.datetime :hora
      t.integer :pendiente
      t.integer :total

      t.timestamps
    end
    add_index :registros, :cuenta_id
  end
end

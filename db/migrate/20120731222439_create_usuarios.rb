class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :correo
      t.string :password_digest
      t.string :remember_token
      
      t.timestamps
    end
    add_index :usuarios, :correo, unique: true
    add_index  :usuarios, :remember_token
  end
end

class CreateAplicaciones < ActiveRecord::Migration
  def change
    create_table :aplicaciones do |t|
      t.string :nombre

      t.timestamps
    end
  end
end

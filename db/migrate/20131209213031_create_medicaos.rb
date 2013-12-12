class CreateMedicaos < ActiveRecord::Migration
  def change
    create_table :medicaos do |t|
      t.integer :km

      t.timestamps
    end
  end
end

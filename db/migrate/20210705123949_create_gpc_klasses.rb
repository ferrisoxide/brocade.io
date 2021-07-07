class CreateGpcKlasses < ActiveRecord::Migration[6.1]
  def change
    create_table :gpc_klasses do |t|
      t.string :code, null: false, index: { unique: true }
      t.string :description
      t.references :gpc_family
      t.timestamps
    end
  end
end

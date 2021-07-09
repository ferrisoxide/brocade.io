class CreateGpcFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :gpc_families do |t|
      t.string :code, null: false, index: { unique: true }
      t.string :description
      t.references :gpc_segment
      t.timestamps
    end
  end
end

class CreateGpcSegments < ActiveRecord::Migration[6.1]
  def change
    create_table :gpc_segments do |t|
      t.string :code, null: false, index: { unique: true }
      t.string :description
      t.timestamps
    end
  end
end

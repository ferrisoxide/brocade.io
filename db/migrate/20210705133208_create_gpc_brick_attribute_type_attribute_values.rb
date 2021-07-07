class CreateGpcBrickAttributeTypeAttributeValues < ActiveRecord::Migration[6.1]
  def change
    # NOTE: Hand-crafting index names to fit >64 char limit in Postgres 
    create_table :gpc_brick_attribute_type_attribute_values do |t|
      
      t.references :gpc_brick, 
        null: false, 
        foreign_key: true, 
        index: { name: 'idx_gpc_brick_attribute_type_and_values_on_brick_id' }
      
      t.references :gpc_attribute_type, 
        null: false, 
        foreign_key: true, 
        index: { name:'idx_gpc_brick_attribute_type_and_values_on_attribute_type_id' }
      
      t.references :gpc_attribute_value, 
        null: true, 
        foreign_key: true, 
        index: { name: 'idx_gpc_brick_attribute_type_and_values_on_attribute_value_id' }
      
      t.timestamps

      t.index %i[gpc_brick_id gpc_attribute_type_id gpc_attribute_value_id], 
        unique: true,
        name: 'idx_gpc_brick_attribute_type_and_values_unique'
    end
  end
end


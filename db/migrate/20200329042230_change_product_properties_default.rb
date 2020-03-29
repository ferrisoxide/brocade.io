class ChangeProductPropertiesDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:products, :properties, {})
  end
end

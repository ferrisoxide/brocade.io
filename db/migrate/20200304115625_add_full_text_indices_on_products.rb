class AddFullTextIndicesOnProducts < ActiveRecord::Migration[6.0]

  COLUMNS = %w[properties name brand_name]

  def up
    COLUMNS.each do |column|
      execute(
        <<~SQL
          CREATE INDEX products_#{column}_full_text_index ON products
          USING gin (( to_tsvector('english', #{column}) ));
        SQL
      )
    end
  end

  def down
    COLUMNS.each do |column|
      execute "drop index products_#{column}_full_text_index"
    end
  end
end

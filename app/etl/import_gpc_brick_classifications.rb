require 'kiba-common/sources/csv'

module ImportGpcBrickClassifications

  module_function
  
  def setup(config)
    Kiba.parse do
      filename = Rails.root.join(
        *%w[db seeds gs1 gpc_brick_classification_sheet.csv]
      )

      source Kiba::Common::Sources::CSV, 
        filename: filename, 
        csv_options: { headers: true, header_converters: :symbol, encoding: 'windows-1251:utf-8' }

      transform { |row| row.to_hash }

      destination Destinations::GpcClassifications::Bricks
    end
  end
end


require 'csv'

namespace :gpc do
  
  namespace :import do
    desc 'Import GS1 GPC attributes and bricks'
    task all: [:attribute_classifications, :brick_classifications]

    desc 'Import GS1 GPC attribute classifications from seed'
    task attribute_classifications: :environment do
      job = ImportGpcAttributeClassifications.setup(nil)
      Kiba.run(job)
    end

    desc 'Import GS1 GPC brick classifications from seed'
    task brick_classifications: :environment do
      job = ImportGpcBrickClassifications.setup(nil)
      Kiba.run(job)
    end
  end
end 

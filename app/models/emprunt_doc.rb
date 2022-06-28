class EmpruntDoc < ApplicationRecord
    def self.to_csv
        attributes = %w{ isbn_livre id_adh  } #allows to type words seperated by space => generate array
            
        CSV.generate(headers: true ) do |csv|
            csv << attributes
    
            all.each do  |emprt|
                csv << emprt.attributes.values_at(*attributes)
            end
            end
       end
end

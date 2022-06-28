class Materiel < ApplicationRecord
    validates :marque, presence: true 
    validates :os, presence: true 
    validates :material_id, presence: true
   def self.to_csv
    attributes = %w{ marque os material_id } #allows to type words seperated by space => generate array
        
    CSV.generate(headers: true ) do |csv|
        csv << attributes

        all.each do  |materiel|
            csv << materiel.attributes.values_at(*attributes)
        end
        end
   end
end

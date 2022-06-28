class Adherent < ApplicationRecord
    validates :nom, presence: true 
    validates :prenom, presence: true 
    validates :adh_id, presence: true 
    def self.to_csv
        attributes = %w{ adh_id nom prenom}

        CSV.generate(headers: true ) do |csv|
            csv << attributes

            all.each do  |materiel|
                csv << materiel.attributes.values_at(*attributes)
            end
        end
   end

end

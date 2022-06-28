class Document < ApplicationRecord
    self.inheritance_column = :_type_disabled 
    validates :type, presence: true 
    validates :titre, presence: true 
    validates :isbn, presence: true 
    validates :auteur, presence: true 
    def self.to_csv
        attributes = %w{ isbn titre auteur type } #allows to type words seperated by space => generate array
            
        CSV.generate(headers: true ) do |csv|
            csv << attributes
    
            all.each do  |document|
                csv << document.attributes.values_at(*attributes)
            end
            end
       end
end

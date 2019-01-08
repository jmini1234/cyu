class User < ActiveRecord::Base
    has_many :likes
    has_many :reports
    has_many :pets
  
    def is_Like?(pet)
       Like.find_by(user_id: self.id, pet_id: pet.id).present?
    end
   
    def is_Report?(pet)
    Report.find_by(user_id: self.id, pet_id: pet.id).present?
    end
  
end

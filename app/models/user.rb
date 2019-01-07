class User < ActiveRecord::Base
    has_many :likes
    has_many :pets
  
    def is_Like?(pet)
       Like.find_by(user_id: self.id, pet_id: pet.id).present?
   end
  
end

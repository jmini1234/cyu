class MypagesController < ApplicationController
    def mypet
        @pets = Pet.where("user_id = ?", current_user.id)
    end
end
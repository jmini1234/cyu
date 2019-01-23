class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.order("created_at DESC").page(params[:page]).per(1)
    @pet = Pet.new
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)
    @pet.save
    redirect_to "/pets"
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    @pet.update(pet_params)
    redirect_to "/pets/#{pet_id}"
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    redirect_to "/pets"
  end

  def like
    @likes = Like.where("user_id = ?", current_user.id)
  end

  def like_toggle
    bookmark = Like.find_by(user_id: current_user.id, pet_id: params[:pet_id])
     if bookmark.nil?
        Like.create(user_id: current_user.id, pet_id: params[:pet_id])
       else
        bookmark.destroy
       end
       redirect_to :back
    end
    
  def report
    @reports = Report.where("user_id = ?", current_user.id)
  end

  def report_toggle
    flag = Report.find_by(user_id: current_user.id, pet_id: params[:pet_id])
     if flag.nil?
        Report.create(user_id: current_user.id, pet_id: params[:pet_id])
       else
        flag.destroy
       end
       redirect_to :back
    end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:image)
    end
end
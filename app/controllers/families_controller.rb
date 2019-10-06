class FamiliesController < ApplicationController
  load_and_authorize_resource :find_by => :name

  before_action :set_family, only: [:edit, :update, :destroy]

  skip_before_action :authenticate_user!, :only => [:register, :register_confirm]

  # GET /families
  # GET /families.json
  def index
    @families = Family.all
  end

  # GET /families/1
  # GET /families/1.json
  def show
  end

  # GET /families/new
  def new
    @family = Family.new
    # @family.build_user
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families
  # POST /families.json
  def create
    @family = Family.new(family_params)

    respond_to do |format|
      if @family.save
        format.html { redirect_to families_path, notice: 'Family was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /families/1
  # PATCH/PUT /families/1.json
  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to families_path, notice: 'Family was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /families/1
  # DELETE /families/1.json
  def destroy
    @family.destroy
    respond_to do |format|
      format.html { redirect_to families_path, notice: 'Family was successfully destroyed.' }
    end
  end

  def register
    @passport_no = params[:passport_no]

    family = Family.find_by(passport_no: @passport_no)
    user = User.find(family.user_id) if family

    if family && !user
      render :register_confirm
    end

    if user
      flash[:alert] = "Passport no registered!"
    else
      flash[:error] = "#{@passport_no} not found!" if @passport_no
    end

  end

  def register_confirm

    user_params = params[:user]
    family = Family.find_by(passport_no: user_params["passport_no"])
    new_user = User.new(email: user_params["email"], password: user_params["password"], password_confirmation: user_params["password_confirmation"], is_family: user_params["is_family"]) 

    if new_user.save && family

      family.user_id = new_user.id
      family.save

      flash[:success] = "Register Success!"
      redirect_to root_path
    else

      flash[:error] = "Email or Password not correct!"
      redirect_to families_register_path
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_params
      params.require(:family).permit(:passport_no, :name, :phone)
    end
end

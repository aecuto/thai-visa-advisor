class FamiliesController < ApplicationController
  load_and_authorize_resource :find_by => :name

  before_action :set_family, only: [:edit, :update, :destroy]
  before_action :set_organization

  # GET /families
  # GET /families.json
  def index
    @families = Family.where(organization_id: @organization.id)
  end

  # GET /families/1
  # GET /families/1.json
  def show
  end

  # GET /families/new
  def new
    @family = Family.new
    @family.build_user
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families
  # POST /families.json
  def create
    @family = Family.new(family_params)
    @family.organization_id = @organization.id

    respond_to do |format|
      if @family.save
        format.html { redirect_to organization_families_new_url, notice: 'Family was successfully created.' }
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
        format.html { redirect_to organization_families_new_url, notice: 'Family was successfully updated.' }
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
      format.html { redirect_to organization_families_new_url, notice: 'Family was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.friendly.find(params[:id])
    end

    def set_organization
      @organization = Organization.friendly.find(params[:organization_id])
    end

    def organization_families_new_url
      organization_families_path(@organization)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_params
      params.require(:family).permit(:name, :phone,
      user_attributes: [:id, :email, :password, :password_confirmation, :role])
    end
end

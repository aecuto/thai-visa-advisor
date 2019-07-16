class MembersController < ApplicationController
  load_and_authorize_resource :find_by => :first_name

  before_action :set_member, only: [:edit, :update, :destroy]
  before_action :set_organization, :set_family

  # GET /members
  # GET /members.json
  def index
    @members = Member.where(family_id: @family.id)
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    @member.family_id = @family.id

    respond_to do |format|
      if @member.save
        format.html { redirect_to organization_family_members_new_url, notice: 'Member was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to organization_family_members_new_url, notice: 'Member was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to organization_family_members_new_url, notice: 'Member was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.friendly.find(params[:id])
    end

    def set_family
      @family = Family.friendly.find(params[:family_id])
    end

    def set_organization
      @organization = Organization.friendly.find(params[:organization_id])
    end

    def organization_family_members_new_url
      organization_family_members_path(@organization, @family)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:first_name, :last_name, :visa_exp, :wp_exp, :noti90, :passport_exp, :doe, :dob)
    end
end

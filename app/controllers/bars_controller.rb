class BarsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :isPartner? , :except => [:index,:search,:show]
  # GET /bars
  # GET /bars.json
  def index
	if current_user.partner?
	redirect_to action: :home
	else
    @bars = Bar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bars }
    end
	end
  end
  
  def home
  @bars= current_user.bars
  end
  

  # GET /bars/1
  # GET /bars/1.json
  def show
    @bar = Bar.find(params[:id])
    @pass_set = @bar.pass_sets.order("created_at").last
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bar }
    end
  end

  # GET /bars/new
  # GET /bars/new.json
  def new
    @bar = Bar.new
	@user = current_user
	@bar.user = @user
	@bar.user_id= @user.id
    @bar.pass_sets.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bar }
    end
  end

  # GET /bars/1/edit
  def edit
    @bar = Bar.find(params[:id])
  end

  # POST /bars
  # POST /bars.json
  def create
    @bar = Bar.new(params[:bar])
	@user = current_user
	@bar.user = @user
	@bar.user_id= @user.id
    respond_to do |format|
      if @bar.save
        format.html { redirect_to @bar, notice: 'Bar was successfully created.' }
        format.json { render json: @bar, status: :created, location: @bar }
      else
        format.html { render action: "new" }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

def search
  @bars = Bar.search params[:search]
end
  # PUT /bars/1
  # PUT /bars/1.json
  def update
    @bar = Bar.find(params[:id])
    @pass_set = @bar.pass_sets.first
    respond_to do |format|
      if @bar.update_attributes(params[:bar])
        format.html { redirect_to @bar, notice: 'Bar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bars/1
  # DELETE /bars/1.json
  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy

    respond_to do |format|
      format.html { redirect_to bars_url }
      format.json { head :no_content }
    end
  end
  

  
end



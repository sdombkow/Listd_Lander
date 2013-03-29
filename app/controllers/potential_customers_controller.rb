class PotentialCustomersController < ApplicationController
  # GET /potential_customers
  # GET /potential_customers.json
  def index
    @potential_customers = PotentialCustomer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @potential_customers }
    end
  end

  # GET /potential_customers/1
  # GET /potential_customers/1.json
  def show
    @potential_customer = PotentialCustomer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @potential_customer }
    end
  end

  # GET /potential_customers/new
  # GET /potential_customers/new.json
  def new
    @potential_customer = PotentialCustomer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @potential_customer }
    end
  end

  # GET /potential_customers/1/edit
  def edit
    @potential_customer = PotentialCustomer.find(params[:id])
  end

  # POST /potential_customers
  # POST /potential_customers.json
  def create
    @potential_customer = PotentialCustomer.new(params[:potential_customer])

    respond_to do |format|
      if @potential_customer.save
        format.html { redirect_to root_path, notice: 'Thank you for inputing your email' }
        format.json { render json: @potential_customer, status: :created, location: @potential_customer }
      else
        format.html { render action: "new" }
        format.json { render json: @potential_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /potential_customers/1
  # PUT /potential_customers/1.json
  def update
    @potential_customer = PotentialCustomer.find(params[:id])

    respond_to do |format|
      if @potential_customer.update_attributes(params[:potential_customer])
        format.html { redirect_to @potential_customer, notice: 'Potential customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @potential_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /potential_customers/1
  # DELETE /potential_customers/1.json
  def destroy
    @potential_customer = PotentialCustomer.find(params[:id])
    @potential_customer.destroy

    respond_to do |format|
      format.html { redirect_to potential_customers_url }
      format.json { head :no_content }
    end
  end
end

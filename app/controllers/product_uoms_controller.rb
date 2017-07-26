
class ProductUomsController < ApplicationController
  # GET /product_uoms
  # GET /product_uoms.json
  def index
    @product_uoms = ProductUom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_uoms }
    end
  end

  # GET /product_uoms/1
  # GET /product_uoms/1.json
  def show
    @product_uom = ProductUom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_uom }
    end
  end

  # GET /product_uoms/new
  # GET /product_uoms/new.json
  def new
    @product_uom = ProductUom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_uom }
    end
  end

  # GET /product_uoms/1/edit
  def edit
    @product_uom = ProductUom.find(params[:id])
  end

  # POST /product_uoms
  # POST /product_uoms.json
  def create
    @product_uom = ProductUom.new(params[:product_uom])

    respond_to do |format|
      if @product_uom.save
        format.html { redirect_to @product_uom, notice: 'Product uom was successfully created.' }
        format.json { render json: @product_uom, status: :created, location: @product_uom }
      else
        format.html { render action: "new" }
        format.json { render json: @product_uom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_uoms/1
  # PUT /product_uoms/1.json
  def update
    @product_uom = ProductUom.find(params[:id])

    respond_to do |format|
      if @product_uom.update_attributes(params[:product_uom])
        format.html { redirect_to @product_uom, notice: 'Product uom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_uom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_uoms/1
  # DELETE /product_uoms/1.json
  def destroy
    @product_uom = ProductUom.find(params[:id])
    @product_uom.destroy

    respond_to do |format|
      format.html { redirect_to product_uoms_url }
      format.json { head :no_content }
    end
  end
end

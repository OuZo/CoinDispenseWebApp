class CashDispensesController < ApplicationController
  # GET /cash_dispenses
  # GET /cash_dispenses.json
  def index
    @cash_dispenses = CashDispense.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cash_dispenses }
    end
  end

  # GET /cash_dispenses/1
  # GET /cash_dispenses/1.json
  def show
    @cash_dispense = CashDispense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      # format.json { render json: @cash_dispense }

      ret = ""
      val = 0
      @cash_dispense.calculate_break_down.each_with_index do |dom,index| 
        if dom.size > 0 
          ret += "#{dom.count} x #{CashDispense::DENOMINATIONS[index]}\n" 
          val += (dom.count * CashDispense::DENOMINATIONS[index])
        end # if  
      end # each 

      ret += "\n#{val}"

      format.json { render json: ret }

    end
  end

  

  # GET /cash_dispenses/new
  # GET /cash_dispenses/new.json
  def new
    @cash_dispense = CashDispense.new

    val = rand(5..30.0)
    nearest = 5
    val % nearest == 0 ? val : val + nearest - (val % nearest)
    @cash_dispense.amount_due = val.round(1.05)

    respond_to do |format|
      format.html # new.html.erb
      # format.json { render json: @cash_dispense }
      format.json { render json: @cash_dispense.amount_due.to_f }
    end
  end

  # GET /cash_dispenses/1/edit
  def edit
    @cash_dispense = CashDispense.find(params[:id])
  end

  # POST /cash_dispenses
  # POST /cash_dispenses.json
  def create
    @cash_dispense = CashDispense.new(params[:cash_dispense])

    respond_to do |format|

      if @cash_dispense.captured_amount >= @cash_dispense.amount_due

        if @cash_dispense.save
          format.html { redirect_to @cash_dispense, notice: 'Cash dispense was successfully created.' }
          format.json { render json: @cash_dispense, status: :created, location: @cash_dispense }
        else
          format.html { render action: "new" }
          format.json { render json: @cash_dispense.errors, status: :unprocessable_entity }
        end
      else 
        format.html { redirect_to new_cash_dispense_path, alert: 'captured_amount must be greater or equal to amount_due.' } 
        format.json { render json: @cash_dispense.errors, status: :unprocessable_entity }
      end
    end # format
  end # create

  # PUT /cash_dispenses/1
  # PUT /cash_dispenses/1.json
  def update
    @cash_dispense = CashDispense.find(params[:id])

    respond_to do |format|
      if @cash_dispense.update_attributes(params[:cash_dispense])
        format.html { redirect_to @cash_dispense, notice: 'Cash dispense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cash_dispense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_dispenses/1
  # DELETE /cash_dispenses/1.json
  def destroy
    @cash_dispense = CashDispense.find(params[:id])
    @cash_dispense.destroy

    respond_to do |format|
      format.html { redirect_to cash_dispenses_url }
      format.json { head :no_content }
    end
  end
end

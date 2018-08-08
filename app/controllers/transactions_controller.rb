class TransactionsController < ApplicationController
  
  skip_before_action :http_basic_authenticate, :only => [:buy_ticket_form, :buy_ticket]

  before_action :set_transaction, only: [:show, :destroy]
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def buy_ticket_form
    train = params[:train][:train].to_i
    cost = params[:cost][:cost].to_f
    @transaction = Transaction.new(train_id: train, cost: cost)
  end

  def buy_ticket
    @transaction = Transaction.new(transaction_params)
      respond_to do |format|
        if @transaction.save
          format.html { redirect_to :root, notice: 'Ticket has been bought' }
          format.json { render :index, status: :created, location: '/' }
        else
          format.html { render :new }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:cost, :description, :user_name)
    end
end

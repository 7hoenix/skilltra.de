class CreditsController < ApplicationController
  before_action :set_credit, only: [:show, :edit, :update, :destroy]


  def index
    @credits = Credit.all
  end

  def show
  end

  def new
    @credit = Credit.new
  end

  def edit
  end

  def create
    @credit = Credit.new(credit_params)

      if @credit.save
        redirect_to @credit, notice: 'Credit was successfully created.'
      else
        render :new
      end
  end

  def update
      if @credit.update(credit_params)
        redirect_to @credit, notice: 'Credit was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @credit.destroy
      redirect_to credits_url, notice: 'Credit was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit
      @credit = Credit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_params
      params.require(:credit).permit(:debit, :credit)
    end
end

class DailyBankStatementsController < ApplicationController
  before_action :set_daily_bank_statement, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @daily_bank_statements = DailyBankStatement.all
    respond_with(@daily_bank_statements)
  end

  def show
    respond_with(@daily_bank_statement)
  end

  def new
    @daily_bank_statement = DailyBankStatement.new
    respond_with(@daily_bank_statement)
  end

  def edit
  end

  def create
    @daily_bank_statement = DailyBankStatement.new(daily_bank_statement_params)
    @daily_bank_statement.save
    respond_with(@daily_bank_statement)
  end

  def update
    @daily_bank_statement.update(daily_bank_statement_params)
    respond_with(@daily_bank_statement)
  end

  def destroy
    @daily_bank_statement.destroy
    respond_with(@daily_bank_statement)
  end

  private
    def set_daily_bank_statement
      @daily_bank_statement = DailyBankStatement.find(params[:id])
    end

    def daily_bank_statement_params
      params[:daily_bank_statement]
    end
end

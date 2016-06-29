class DailyStatementsController < ApplicationController
  before_action :set_daily_statement, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    if params[:daily_bank_statement_id]
      @daily_statements = DailyStatement.where(:daily_bank_statement_id => params[:daily_bank_statement_id])
    elsif params[:business_partner_id]
      @daily_statements = DailyStatement.where(:business_partner_id => params[:business_partner_id])
    else
      @daily_statements = DailyStatement.all
    end

    respond_with(@daily_statements)
  end

  def show
    respond_with(@daily_statement)
  end

  def new
    @daily_statement = DailyStatement.new
    respond_with(@daily_statement)
  end

  def edit
  end

  def create
    @daily_statement = DailyStatement.new(daily_statement_params)
    @daily_statement.save
    respond_with(@daily_statement)
  end

  def update
    @daily_statement.update(daily_statement_params)
    respond_with(@daily_statement)
  end

  def destroy
    @daily_statement.destroy
    respond_with(@daily_statement)
  end

  private
    def set_daily_statement
      @daily_statement = DailyStatement.find(params[:id])
    end

    def daily_statement_params
      params[:daily_statement]
    end
end

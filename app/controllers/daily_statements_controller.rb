class DailyStatementsController < ApplicationController
  before_action :set_daily_statement, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @daily_statements = DailyStatement.all
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

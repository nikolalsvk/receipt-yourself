class DailyStatementItemsController < ApplicationController
  before_action :set_daily_statement_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @daily_statement_items = DailyStatementItem.all
    respond_with(@daily_statement_items)
  end

  def show
    respond_with(@daily_statement_item)
  end

  def new
    @daily_statement_item = DailyStatementItem.new
    respond_with(@daily_statement_item)
  end

  def edit
  end

  def create
    @daily_statement_item = DailyStatementItem.new(daily_statement_item_params)
    @daily_statement_item.save
    respond_with(@daily_statement_item)
  end

  def update
    @daily_statement_item.update(daily_statement_item_params)
    respond_with(@daily_statement_item)
  end

  def destroy
    @daily_statement_item.destroy
    respond_with(@daily_statement_item)
  end

  private
    def set_daily_statement_item
      @daily_statement_item = DailyStatementItem.find(params[:id])
    end

    def daily_statement_item_params
      params[:daily_statement_item]
    end
end

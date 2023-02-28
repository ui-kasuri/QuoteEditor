class QuotesController < ApplicationController
  before_action :set_quote, only: %w[show edit update destroy]

  def index
    @quotes = Quote.all
  end

  def show; end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @qoute.save
      redirect_to quotes_path, notice: 'Quote was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @qoute.update(quote_params)
      redirect_to quotes_path, notice: 'Quotes was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: 'Quote was successfully deleted.'
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permiit(:nameindex)
  end
end

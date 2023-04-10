class QuotesController < ApplicationController
  before_action :set_quote, only: %i(show edit update destroy)

  def index
    # @quotes = Quote.ordered
    @quotes = current_company.quotes.ordered
  end

  def show
    @line_item_dates = @quote.line_item_dates.ordered
  end

  def new
    @quote = Quote.new
  end

  def create
    # Only this first line changes to make sure the association is created
    # @quote = Quote.new(quote_params)
    @quote = current_company.quotes.build(quote_params)

    # We use flash.now[:notice] here and not flash[:notice] because
    # Turbo Stream responses don't redirect to other locations,
    # so the flash has to appear on the page right now
    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @quote.update(quote_params)
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
    end
  end

  private

  def set_quote
    # @quote = Quote.find(params[:id])
    # We must use current_company.quotes here instead of Quote
    # for security reasons
    @quote = current_company.quotes.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end

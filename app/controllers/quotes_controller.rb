class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy vote]

  # GET /quotes
  def index
     sort_by = params[:sort_by]

    if sort_by == 'year'
      @quotes = Quote.order(year: :asc)
    elsif sort_by == 'said_by'
      @quotes = Quote.order(said_by: :asc)
    elsif sort_by == 'saying'
      @quotes = Quote.order(saying: :asc)
    else
      @quotes = Quote.all
    end
  end

  # GET /quotes/1
  def show
    @quote
  end

  def vote
    # Adjust the logic based on your voting requirements
    if params[:type] == 'upvote'
      @quote.increment!(:votes_count)
    elsif params[:type] == 'downvote'
      @quote.decrement!(:votes_count)
    end
    redirect_to quotes_path
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: "Quote was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quotes/1
  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /quotes/1
  def destroy
    @quote.destroy!
    redirect_to quotes_url, notice: "Quote was successfully deleted.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:saying, :said_by, :year, :notes)
    end


end

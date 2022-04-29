class BooksController < ApplicationController
  before_action :authorize_request
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = Book.all

    render json: @books
  end

  # GET /books/1
  def show
    authorize @book

    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    authorize @book

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    authorize @book

    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    authorize @book

    @book.destroy
  end

  # GET /search
  def search
    @books = Book.where("title LIKE ? OR author LIKE ? OR genre LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    render json: @books
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.permit(
        :title, :author, :genre, :publisher, :cost
      )
    end
end

class BooksController < ApplicationController
    before_action :set_book, only: %i[show editBook update destroy]
  
    def index
      @books = Book.all
    end
  
    def show
    end
  
    def new
      @book = Book.new
    end
  
    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to books_path, notice: 'Le livre a été ajouté avec succès.'
      else
        render 'newBook', status: :unprocessable_entity
      end
    end
  
    # Renommer l'action 'edit' en 'editBook'
    def editBook
      # Le code pour l'action editBook, par exemple, pour afficher un formulaire de modification
    end
  
    def update
      if @book.update(book_params)
        redirect_to @book, notice: 'Le livre a été mis à jour avec succès.'
      else
        render :editBook, status: :unprocessable_entity
      end
    end
  
    def destroy
      @book.destroy
      redirect_to books_path, notice: 'Le livre a été supprimé.'
    end
  
    private
  
    def set_book
      @book = Book.find(params[:id])
    end
  
    def book_params
      params.require(:book).permit(:title, :author, :is_borrowed, :date)
    end
  end
  
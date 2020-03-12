class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :current_user_book,only:[:edit]

	def create
		@new_book = Book.new(book_params)
		@new_book.user_id = current_user.id
		if @new_book.save
			flash[:notice] = "You have creatad book successfully."
		 	redirect_to book_path(@new_book.id)
		else
			@user = current_user
			@books = Book.all
			@users = User.all
			render  'index'
		end


	end
	def index
		@books = Book.all
		@new_book = Book.new
		@user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@books = Book.all
		@new_book = Book.new
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
	def edit
		@book= Book.find(params[:id])
	end
	def update
		@book= Book.find(params[:id])
      	if @book.update(book_params)
		   flash[:notice]="You have updated book successfully.."
		   redirect_to book_path
	    else
	    	render'edit'
	    end
end

	private
	def current_user_book
		 book = Book.find(params[:id])
		 if current_user !=book.user
		 	redirect_to  books_path
		 end

	end
	def book_params
		params.require(:book).permit(:title,:body)
	end
end

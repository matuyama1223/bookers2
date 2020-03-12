class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :currect_user, only:[:edit, :update]

def index
	if user_signed_in?
	@books = Book.all
	@new_book = Book.new
	@user = current_user.id
	@users = User.all
	else
    redirect_to new_user_session_path
	end
end
def show
	@book =Book.new
	@user = User.find(params[:id])
	@books=@user.books
	flash[:notice] = "Signed in successfully."

end
def edit
	@user = User.find(params[:id])
end
def update

	@user = User.find(params[:id])
	if @user.update(user_params)
	flash[:notice] = "User was successfully updated."
	redirect_to user_path(@user.id)
	else
		render 'edit'
	end
end

private
def currect_user
	user = User.find(params[:id])
	if current_user != user
		redirect_to user_path(current_user)
	end
end

def user_params
	params.require(:user).permit(:name, :profile_image,:introduction)
end
end
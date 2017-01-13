class UsersController < ApplicationController
  def index
    #Test test
    @users=User.all
  end
  def new
    @user=User.new
  end
  def create
     @user=User.new(user_params)
     if @user.save
       redirect_to :action => :index
     else
       render 'new'
     end
 end
 def edit
   @user=User.find(params[:id])
 end
 def update 
   @user=User.find(params[:id])
   if @user.update(user_params)
     redirect_to @user
   else
     render 'edit'
   end
   
 end
def show
  @user=User.find(params[:id])
end
 
 def destroy
   @user=User.find(params[:id])
   @user.destroy
   redirect_to users_path
   
 end
 
 private
    def user_params
      params.require(:user).permit(:name,:email,:cost_of_meal)
    end
end

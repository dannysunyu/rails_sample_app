class Api::V1::UsersController < Api::V1::BaseController

  def show
    @user = User.find(params[:id])

    @envelop = Hash.new
    @envelop[:meta] = { :code => 200 }
    @envelop[:data] = @user
    @envelop[:pagination] = Hash.new
    @envelop[:pagination][:next_url] = nil
  end

  def create
    @user = User.new(user_params)
    # debugger
    if @user.save
      # redirect_to 'localhost:3000/api/v1/users/show'
      @envelop = Hash.new
      @envelop[:meta] = { :code => 200 }
      @envelop[:data] = @user
      @envelop[:pagination] = Hash.new
      @envelop[:pagination][:next_url] = nil
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
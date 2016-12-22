class Admin::UsersController < Admin::AdminController

  include Adminable
  include Sortable

  def index
    @users = User.page(params[:page]).per(@per_page)

    @status_id = params[:status_id]
    @users = @users.where(status_id: @status_id) unless @status_id.blank?

    unless @order.blank?
      @users = @users.order("#{@order} #{@dir}")
    else
      @users = @users.ordered
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: flash_message(@user).html_safe
    else
      render action: :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: flash_message(@user).html_safe
    else
      render action: :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'Deleted.'
  end

  def search
    users = User.skinny.search(params[:term])
    render json: users.map{ |user| {
      id: user.id,
      label: user.email,
      url: edit_admin_user_path(user),
    }}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def setup_model
      @user = User.find_by_id!(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
      )
    end
end

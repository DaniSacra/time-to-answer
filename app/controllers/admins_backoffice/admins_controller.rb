class AdminsBackoffice::AdminsController < AdminsBackofficeController
  
  before_action :set_admin, only: [:edit, :update]
  before_action :admin_params, only: [:update]
  before_action :verify_password, only: [:update]

  def index
    @admins = Admin.all.order(:id)
  end

  def edit
    #before_action
  end

  def update

    if @admin.update(admin_params)
      redirect_to admins_backoffice_admins_path, notice: "Administrador salvo com sucesso"
    else
      render :edit
    end

  end

  private

    def set_admin
      @admin = Admin.find(params[:id])  
    end

    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation)
    end
    
    #extract passwords from params
    def verify_password
      if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
        params.extract!(:password, :password_confirmation)
      end  
    end
    
end

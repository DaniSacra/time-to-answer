class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @subjects = Subject.all.order(:id).page(params[:page]).per(3)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to admins_backoffice_subjects_path, notice: "Assunto/Área cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update    
    if @subject.update(subject_params)
#      AdminMailer.update_email(current_admin, @subject).deliver_now
      redirect_to admins_backoffice_subjects_path, notice: "Assunto/Área atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      redirect_to admins_backoffice_subjects_path, notice: "Assunto/Área excluído com sucesso!"
    else
      render :index
    end
  end

  private
  
  def subject_params
    params.require(:subject).permit(:description)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end

end

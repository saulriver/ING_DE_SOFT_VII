class ProgramasController < ApplicationController
#
protect_from_forgery with: :exception
#
 before_action :authenticate_user!
 #layout false
  def index
    if params[:search].present?
    @programas = Programa.where("nombre LIKE ?", "%#{params[:search]}%").page params[:page]
      else
        @programas = Programa.all.page params[:page]#.order(:decano).page params[:page]
        end

  end

  def new
    @programa = Programa.new
  end

  def create
    @programa = Programa.new(programa_params)

    if @programa.save

      redirect_to new_programa_path(@programa), notice: 'Registro Exitoso'

    else
      render :new
    end
  end

  def show
    @programa = Programa.find(params[:id])
  end

  def edit
    @programa = Programa.find(params[:id])
  end

  def update
    @programa = Programa.find(params[:id])

    if @programa.update(programa_params)

      redirect_to programas_path(@programa), notice: 'Actualizado'

  else
      render :edit
   end
  end

  def destroy
    @programa = Programa.find(params[:id])
    @programa.destroy
      redirect_to programas_path(@programas), notice: 'Eliminado'
  end

  private

  def programa_params
    params.require(:programa).permit(:codigo, :nombre, :encargado, :facultad_id, :search, :page)
  end

end

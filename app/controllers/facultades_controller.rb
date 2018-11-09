class FacultadesController < ApplicationController
  #
  protect_from_forgery with: :exception
  #
  before_action :authenticate_user!
  #layout false
  def index
    if
    @facultades = Facultad.where("nombre LIKE ?", "%#{params[:search]}%")
      else
    @facultades = Facultad.all
        end

  end

  def new
    @facultad = Facultad.new
  end

  def create
    @facultad = Facultad.new(facultad_params)

    if @facultad.save

      redirect_to  new_facultad_path(@facultad), notice: 'Registro Exitoso'

    else
      render :new
    end
  end

  def show
    @facultad = Facultad.find(params[:id])
  end

  def edit
    @facultad = Facultad.find(params[:id])
  end

  def update
    @facultad = Facultad.find(params[:id])

    if @facultad.update(facultad_params)

      redirect_to facultades_path(@facultad), notice: 'Actualizado'

  else
      render :edit
   end
  end

  def destroy
    @facultad = Facultad.find(params[:id])
    @facultad.destroy
      redirect_to facultades_path(@facultad), notice: 'Eliminado'
  end

  private

  def facultad_params
    params.require(:facultad).permit(:nombre, :decano, :search)
  end

end

class EgresadosController < ApplicationController
  def index
    @egresados = Egresado.all
  end

  def new
    @egresado = Egresado.new
  end

  def create
    @egresado = Egresado.new(egresado_params)

    if @egresado.save
      
      redirect_to  new_egresado_path(@egresado), notice: 'Registro Exitoso'

    else
        render :new
      end
  end

  def show
    @egresado = Egresado.find(params[:id])
  end

  def edit
    @egresado = Egresado.find(params[:id])
  end

  def update
    @egresado = Egresado.find(params[:id])

    if @egresado.update(egresado_params)

        redirect_to egresados_path(@egresado), notice: 'Actualizado'

      else
        render :edit
       end
  end

  def destroy
    @egresado = Egresado.find(params[:id])
    @egresado.destroy
    redirect_to egresados_path(@egresado), notice: 'Eliminado'
  end

  private

  def egresado_params
    params.require(:egresado).permit(:nombre, :apellidos, :ingreso, :egreso, :contingente, :facultad_id,
    :programa_id, :telefono, :correo, :direccion)
  end

end

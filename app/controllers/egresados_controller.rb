class EgresadosController < ApplicationController
#
protect_from_forgery with: :exception
#
before_action :authenticate_user!
#layout false

  def index
  #no se si sera una buena practica esta forma de colocar el codigo de busqueda en el def index para la asignacion de formas de busqueda con el metodo LIKE de postgrade SQL.
  if params[:search].present?
  @egresados = Egresado.where("nombre LIKE ?", "%#{params[:search]}%").page params[:page]#parametro para la paginacion de tablas o paginas
    else
  @egresados = Egresado.all.page params[:page]#parametro para la paginacion de tablas o paginas
  respond_to do |format|#parametro para mostrar en pdf
    format.html
    format.json
    format.pdf {render template: 'layouts/reporte.html.erb',  pdf: 'reporte'}
  end#fin del parametro pdf
    end
end
#fin def index

  def new
    @egresado = Egresado.new
  end
#fin def new

  def create
    @egresado = Egresado.new(egresado_params)

    if @egresado.save
      redirect_to  new_egresado_path(@egresado), notice: 'Registro Exitoso'
    else
        render :new
      end
  end
#fin def create

  def show
    @egresado = Egresado.find(params[:id])
  end
#fin def show

  def edit
    @egresado = Egresado.find(params[:id])
end
#fin def edit

  def update
    @egresado = Egresado.find(params[:id])
    if @egresado.update(egresado_params)
        redirect_to egresados_path(@egresado), notice: 'Actualizado'
      else
        render :edit
       end
  end
# fin def update

  def destroy
    @egresado = Egresado.find(params[:id])
    @egresado.destroy
    redirect_to egresados_path(@egresado), notice: 'Eliminado'
  end
#fin def destroy

  private

  def egresado_params
    params.require(:egresado).permit(:nombre, :apellidos, :ingreso, :egreso, :contingente, :facultad_id,
    :programa_id, :telefono, :correo, :direccion, :search, :page)
    end
    #fin def egresado_params

  end

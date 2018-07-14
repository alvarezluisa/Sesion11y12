class ArticulosController < ApplicationController
  http_basic_authenticate_with name: "nasugo", password: "JEPA", except: [:index, :show]

  def new
    @articulo = Articulo.new
  end
  def create
  #  render plain: params[:articulo].inspect
    @articulo = Articulo.new(articulo_params)

    if @articulo.save
       redirect_to @articulo
    else
      render 'new'
    end
  end
  def edit
    set_articulo
  end
  def update
    set_articulo
    if @articulo.update(articulo_params)
      redirect_to @articulo
    else
      render 'edit'
    end
  end
  def show
    set_articulo
  end

  def index
    @articulos = Articulo.all
  end
  def destroy
    set_articulo
    @articulo.destroy

    redirect_to articulos_path
  end
  private
    def articulo_params
        params.require(:articulo).permit(:title, :text)
    end
    def set_articulo
      @articulo = Articulo.find(params[:id])
    end


end

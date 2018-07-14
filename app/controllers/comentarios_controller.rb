class ComentariosController < ApplicationController
  http_basic_authenticate_with name: "nasugo", password: "JEPA", only: :destroy
  def create
    find_articulo
    @comentario = @articulo.comentarios.create(comentario_params)
    redirect_to articulo_path(@articulo)
  end
  def destroy
    find_articulo
    @comentario = @articulo.comentarios.find(params[:id])
    @comentario.destroy
    redirect_to articulo_path(@articulo)
  end
  private
    def comentario_params
      params.require(:comentario).permit(:nombre, :cuerpo)
    end
    def find_articulo
      @articulo = Articulo.find (params[:articulo_id])
    end
end

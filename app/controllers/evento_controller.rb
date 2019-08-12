class EventoController < ApplicationController

	def index
    @eventos = Evento.all
	end

  def create
    @eventos = Evento.new(evento_params)

			if @eventos.noticia != "" && @eventos.noticia_foto.blank? || @eventos.noticia == "" && @eventos.noticia_foto.present? || @eventos.noticia != "" && @eventos.noticia_foto.present?
				if @eventos.save
					redirect_to evento_index_path, id: @eventos.id,  notice: 'Evento publicado com sucesso!'
				end
			else
				redirect_to evento_index_path, notice: 'Evento não publicado! Notícia não pode ficar em branco.'
			end
  end


  def evento_params
      params.permit(:noticia, :noticia_foto)
  end
end

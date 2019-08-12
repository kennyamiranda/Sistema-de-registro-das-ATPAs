class DuvidaController < ApplicationController

	def index
    @duvidas = Duvida.all
	end

  # def create
  #   @duvidas = Duvida.new(duvidas_params)
	#
  #   if @duvidas.save
  #     redirect_to duvida_index_path, id: @duvidas.id,  notice: 'Dúvida publicada com sucesso!'
  #   else
	# 		render :index, notice: 'Dúvida não publicada. Não é permitida publicação com campo em Branco!'
	# 	end
  # end

	def edit
		@duvidas = Duvida.find(params[:id])
		session[:id_duvida] = params['id']
		session[:duvida] = params['duvida']
	end

	def update
		if current_user.role != "admin"
			@duvidas = Duvida.new(duvidas_params)

	    if @duvidas.save
	      redirect_to duvida_index_path, id: @duvidas.id,  notice: 'Dúvida publicada com sucesso!'
	    else
				render :index, notice: 'Dúvida não publicada. Não é permitida publicação com campo em Branco!'
			end

		else
			@id_duvida = session[:id_duvida]
			Duvida.where(id: @id_duvida).update(resposta_params)

			redirect_to duvida_index_path
		end
	end


  def duvidas_params
      params.permit(:duvida)
  end

	def resposta_params
		params.permit(:resposta)
	end
end

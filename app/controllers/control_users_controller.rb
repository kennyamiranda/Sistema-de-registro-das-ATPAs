class ControlUsersController < ApplicationController
  	before_action :authenticate_user!
  	before_action :is_admin, only: [:index, :horas_user]



	def index
		# @users = User.all
		# authorize @users
    if params[:search].present?
      @users = User.order(nome: :DESC).where("nome LIKE :search OR matricula LIKE :search OR licenciatura LIKE :search", search: "%#{params[:search]}%".titleize)
      if @users.exists?
      else
        @users = User.order(nome: :DESC).where("nome LIKE :search OR matricula LIKE :search OR licenciatura LIKE :search", search: "%#{params[:search]}%".downcase)
        if @users.exists?
        else
          @users = User.order(nome: :DESC).where("nome LIKE :search OR matricula LIKE :search OR licenciatura LIKE :search", search: "%#{params[:search]}%".uppercase)
        end
      end
    else
      @users = User.order(nome: :DESC).where("nome LIKE :search OR matricula LIKE :search OR licenciatura LIKE :search", search: "%#{params[:search]}%")
    end
  # ...
	end


	def is_admin
		if(current_user.role != "admin")
      	redirect_to root_path
      	flash[:notice] = "Você não tem acesso ao catálogo de usuários"
    end
  end

  def horas_user
        @users = User.all
        @value_nome = params['nome']
  end
end

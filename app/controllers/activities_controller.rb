class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :pertence, only: [:show, :edit]

  require './lib/generate_pdf'
  # GET /activities
  # GET /activities.json
  def index
    if current_user.role == "admin"
        # Encapsulamento para a pesquisa dos parâmetros pelos alunos
        @activities = Activity.order(status: :DESC).where("titulo LIKE :search OR status LIKE :search OR relatorio LIKE :search OR edited_by LIKE :search OR nome_grupo LIKE :search OR local_realizacao_atividade LIKE :search OR relatorio LIKE :search OR status LIKE :search OR feedback LIKE :search OR edited_by LIKE :search OR nome_usuario LIKE :search OR nome_do_evento LIKE :search", search: "%#{params[:search]}%")
        @user = User.order(status: :DESC).where("nome LIKE :search", search: "%#{params[:search]}%")
        if @activities.exists? || @user.exists?
        else
          @activities = Activity.order(status: :DESC).where("titulo LIKE :search OR status LIKE :search OR relatorio LIKE :search OR edited_by LIKE :search OR nome_grupo LIKE :search OR local_realizacao_atividade LIKE :search OR relatorio LIKE :search OR status LIKE :search OR feedback LIKE :search OR edited_by LIKE :search OR nome_usuario LIKE :search OR nome_do_evento LIKE :search", search: "%#{params[:search]}%".titleize)
          @user = User.order(status: :DESC).where("nome LIKE :search", search: "%#{params[:search]}%".titleize)
          if @activities.exists? || @user.exists?
          else
            @activities = Activity.order(status: :DESC).where("titulo LIKE :search OR status LIKE :search OR relatorio LIKE :search OR edited_by LIKE :search OR nome_grupo LIKE :search OR local_realizacao_atividade LIKE :search OR relatorio LIKE :search OR status LIKE :search OR feedback LIKE :search OR edited_by LIKE :search OR nome_usuario LIKE :search OR nome_do_evento LIKE :search", search: "%#{params[:search]}%".titleize)
            @user = User.order(status: :DESC).where("nome LIKE :search", search: "%#{params[:search]}%".titleize)
          end
        end
    else
      @activities = current_user.activities.order(status: :DESC).where("titulo LIKE :search OR status LIKE :search OR relatorio LIKE :search OR edited_by LIKE :search OR nome_grupo LIKE :search OR local_realizacao_atividade LIKE :search OR relatorio LIKE :search OR status LIKE :search OR feedback LIKE :search OR edited_by LIKE :search OR nome_do_evento LIKE :search", search: "%#{params[:search]}%")
    end

    # Código para renderização do PDF
    respond_to do |format|
     format.html
     format.pdf do
       @users = User.all
       @activities = Activity.all

       @user_nome = params['nome']

       pdf = RelatorioPdf.new(@users, @activities, @user_nome, :margin => [50])
       send_data pdf.render, filename: 'relatorio.pdf', type: 'application/pdf', disposition: 'inline'
     end
    end

  end

  # GET /activities/1
  # GET /activities/1.json
  def show

  end

  # GET /activities/new
  # Código para renderização da página "new"
  def new
    @activity = Activity.new
    @activity_grupo_0 = [ "Palestras", "Seminários", "Congressos", "Simpósios", "Fóruns", "Encontros", "Mesas Redondas e Similares"]
    @value_id = params['id']
    @value_nome = params['nome']

    session[:variavel_nome] = @value_nome
    session[:userID] = @value_id

  end

  # GET /activities/1/edit
  # Código para edição da atividade
  def edit
    @activity_grupo_0 = [ "Palestras", "Seminários", "Congressos", "Simpósios", "Fóruns", "Encontros", "Mesas Redondas e Similares"]
  end

  # POST /activities
  # POST /activities.json
  # Código para criação da atividade
  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    @activity.nome_usuario = @activity.user.nome
    @activity.status = "Pendente"
    @activity_grupo_0 = Activity.all
    if @activity.grupo == 0
      @activity.nome_grupo = '1.1 - Participação como ouvinte em Palestras, Seminários,
      Congressos, Conferências, Simpósios, Fóruns, Encontros,
      Mesas Redondas e similares (30H)'
    end

    if @activity.grupo == 1
      @activity.nome_grupo = '1.2 - Participação no desenvolvimento de projetos de extensão sob
      orientação de professor,na área de formação (20H)'
    end

    if @activity.grupo == 2
      @activity.nome_grupo = '1.3 - Visitas orientadas a exposições, museus, teatros, patrimônio
      artístico ou cultural (20H)'
    end

    if @activity.grupo == 3
      @activity.nome_grupo = '1.4 - Representação em Órgãos Colegiados e/ou Comissões do
      IFFluminense campus Campos Centro (10H)'
    end

    if @activity.grupo == 4
      @activity.nome_grupo = '1.5 - Participação em atividade de extensão, na área de formação, nas
      modalidades presencial e/ou semipresencial (50H)'
    end

    if @activity.grupo == 5
      @activity.nome_grupo = '1.6 - Atuação em função de bolsista no IFFluminense, em no mínimo
      02 (dois) períodos letivos (20h)'
    end

    if @activity.grupo == 6
      @activity.nome_grupo = '1.7 - Participação em curso de extensão, na área de formação, na
      modalidade online (20H)'
    end

    if @activity.grupo == 7
      @activity.nome_grupo = '1.8 - Participação em Atividade de Monitoria, na área de formação,
      no 2º segmento do Ensino Fundamental, em Cursos de Nível
      Médio e/ou em Curso Superior (20h)'
    end

    if @activity.grupo == 8
      @activity.nome_grupo = '2.1 - Participação como ouvinte na apresentação oral de Defesa do
      Projeto de Qualificação de Trabalho de (Conclusão Dissertação
      e Tese), na área de formação e/ou em áreas afins à formação (20H)'
    end

    if @activity.grupo == 9
      @activity.nome_grupo = '2.2 - Participação como ouvinte na apresentação oral de Monografias
      (Trabalho Conclusão de Curso, Dissertação e Tese), na área de
      formação e/ou em áreas afins à formação (30H)'
    end

    if @activity.grupo == 10
      @activity.nome_grupo = '2.3 - Participação como ouvinte em Palestras, Seminários,Congressos,
      Conferências, Simpósios, Fóruns, Encontros, Mesas Redondas,
      minicursos, oficinas e similares (50h)'
    end

    if @activity.grupo == 11
      @activity.nome_grupo = '2.4 - Participação como ouvinte em atividades artísticas e culturais
      sob a supervisão de professor e/ou de profissional do
      IFFluminense (35H)'
    end

    if @activity.grupo == 12
      @activity.nome_grupo = '3.1 - Apresentação de trabalhos acadêmicos, científicos ou culturais
      em instituições de âmbito local, regional, nacional e/ou
      internacional (40H, 5H por trabalho apresentado)'
    end

    if @activity.grupo == 13
      @activity.nome_grupo = '3.2 - Publicação em periódicos (40H, 10H por trabalho publicado)","Publicação em Livros (40H, 10H por trabalho publicado)'
    end

    if @activity.grupo == 14
      @activity.nome_grupo = '3.3 - Publicação em Livros (40H, 10H por trabalho publicado)'
    end

    if @activity.grupo == 15
      @activity.nome_grupo = '3.4 - Participação na organização e coordenação de eventos
      acadêmico-científico-culturais internos ou externos ao
      IFFluminense (30H, 5H para cada dia de participação)'
    end

    if @activity.grupo == 16
      @activity.nome_grupo = '3.5 - Participação no desenvolvimento de projetos de pesquisa, por
      semestre letivo (10H)'
    end

    if @activity.grupo == 17
      @activity.nome_grupo = '3.6 - Participação em Grupo de Estudo Temático soborientação de
      professor, por semestre letivo, na área de formação e/ou em
      áreas afins à formação (5H)'
    end

    if @activity.grupo == 18
      @activity.nome_grupo = '3.7 - Apresentação de trabalhos de pesquisa institucional em eventos
      científicos internos ou externos (40H, 5H pora cada apresentação)'
    end

    if @activity.grupo == 22
      @activity.nome_grupo = 'Outros'
    end

    if current_user.role == "admin"
      @activity.user_id = session[:userID]
    end

    @value_nome = session[:variavel_nome]
    @value_id = session[:userID]

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activities_show_path(:id => @activity.id), notice: 'Atividade criada com sucesso.'  }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  # Código para atualização da atividade
  def update
    if current_user.role == "admin"
      @activity.edited_by = current_user.nome
    end

    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Atividade atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  # Código para exclusão da atividade
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Atividade excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  # Código para gerar o PDF das atividades por parte do aluno
  def export
    pdf = GeneratePdf::activity(current_user, current_user.activities)
    send_data pdf.render,
      filename: "relatorioativ",
      type: 'application/pdf',
      disposition: 'inline'
  end

  def pertence
    if ((current_user.role != "admin")&&(current_user.id != @activity.user_id))
      flash[:notice] = "Essa atividade não está acessível para você"
      redirect_to activities_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])

      #@activity = Activity.new(activity_params)
      #current_user = @activity.user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:edited_by,:grupo, :tipo, :status ,:feedback, :data_evento, :titulo, :local_realizacao_atividade, :nome_do_evento, :relatorio, :user_id, :hora_computada, {documents: []})
    end


end

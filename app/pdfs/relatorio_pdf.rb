class RelatorioPdf < Prawn::Document
  def initialize(users, activities, user_nome, margin: 50)
    super(top_margin: 70)
    @users = users
    @activities = activities
    @user_nome = user_nome


      fill_color "40464e"

      # Define a cor do traçado
       fill_color "666666"
       image "#{Rails.root}/public/logo/ifflogo.png", :at => [-50,760], :scale => 0.5

      # Cria um texto com tamanho 30 PDF Points, bold alinha no centro
       text "Relatório de Atividades
                Cadastradas", :size => 26, :style => :bold, :align => :center

      # Move 80 PDF points para baixo o cursor
      move_down 30
      @users.each do |users|
           if(users.nome == @user_nome)

             text "Dados do Aluno
                      Nome: #{users.nome}
                      Matrícula: #{users.matricula}
                      Curso: #{users.licenciatura}\n
                      Quantidade de horas cadastradas:\n", :size => 12, :style => :bold
            if(users.cargahoraria[19] >= MAXIMO[19])
               text "Grupo 1: #{MAXIMO[19]} de #{MAXIMO[19]} - Aprovado", :size => 12, :style => :bold
            else
               text "Grupo 1: #{users.cargahoraria[19]} de #{MAXIMO[19]} - Insuficiente", :size => 12, :style => :bold
            end
            if(users.cargahoraria[20] >= MAXIMO[20])
               text "Grupo 2: #{MAXIMO[20]} de #{MAXIMO[20]} - Aprovado", :size => 12, :style => :bold
            else
               text "Grupo 2: #{users.cargahoraria[20]} de #{MAXIMO[20]} - Insuficiente", :size => 12, :style => :bold
            end
            if(users.cargahoraria[21] >= MAXIMO[21])
               text "Grupo 3: #{MAXIMO[21]} de #{MAXIMO[21]} - Aprovado", :size => 12, :style => :bold
            else
               text "Grupo 3: #{users.cargahoraria[21]} de #{MAXIMO[21]} - Insuficiente", :size => 12, :style => :bold
            end
             move_down 20
            table_data = [["<b>Grupo/Subgrupo de Atividade</b>", "Horas Cadastradas"],
                          ["<b>Grupo 1 ATIVIDADES DE EXTENSÃO / DE ENSINO</b>", "<b>#{users.cargahoraria[19]}<b>"],
                          ["<b>1.1 Participação como ouvinte em Palestras, Seminários,
                            Congressos, Conferências, Simpósios, Fóruns, Encontros,
                            Mesas Redondas e similares</b>", "<b>#{users.cargahoraria[0]}<b>"],
                          ["<b>1.2 Participação no desenvolvimento de projetos de extensão sob
                            orientação de professor,na área de formação</b>", "<b>#{users.cargahoraria[1]}<b>"],
                          ["<b>1.3 Visitas orientadas a exposições, museus, teatros, patrimônio
                            artístico ou cultural </b>", "<b>#{users.cargahoraria[2]}<b>"],
                          ["<b>1.4 Representação em Órgãos Colegiados e/ou Comissões do
                            IFFluminense campus Campos Centro</b>", "<b>#{users.cargahoraria[3]}<b>"],
                          ["<b>1.5 Participação em atividade de extensão, na área de formação, nas
                            modalidades presencial e/ou semipresencial</b>", "<b>#{users.cargahoraria[4]}<b>"],
                          ["<b>1.6 Atuação em função de bolsista no IFFluminense, em no mínimo
                            02 (dois) períodos letivos</b>", "<b>#{users.cargahoraria[5]}<b>"],
                          ["<b>1.7 Participação em curso de extensão, na área de formação, na
                            modalidade online </b>", "<b>#{users.cargahoraria[6]}<b>"],
                          ["<b>1.8 Participação em Atividade de Monitoria, na área de formação,
                            no 2.º segmento do Ensino Fundamental, em Cursos de Nível
                            Médio e/ou em Curso Superior</b>", "<b>#{users.cargahoraria[7]}<b>"],
                          ["<b>Grupo 2 ATIVIDADES ACADÊMICO CIENTÍFICO CULTURAIS", "<b>#{users.cargahoraria[20]}<b>"],
                          ["<b>2.1 Participação como ouvinte na apresentação oral de Defesa do
                            Projeto de Qualificação de Trabalho de Conclusão Dissertação
                            e Tese), na área de formação e/ou em áreas afins à formação</b>", "<b>#{users.cargahoraria[8]}<b>"],
                          ["<b>2.2 Participação como ouvinte na apresentação oral de Monografias
                            (Trabalho Conclusão de Curso, Dissertação e Tese), na área de
                            formação e/ou em áreas afins à formação</b>", "<b>#{users.cargahoraria[9]}<b>"],
                          ["<b>2.3 Participação como ouvinte em Palestras, Seminários,Congressos,
                            Conferências, Simpósios, Fóruns, Encontros, Mesas Redondas,
                            minicursos, oficinas e similares</b>", "<b>#{users.cargahoraria[10]}<b>"],
                          ["<b>2.4 Participação como ouvinte em atividades artísticas e culturais
                            sob a supervisão de professor e/ou de profissional do
                            IFFluminense</b>", "<b>#{users.cargahoraria[11]}<b>"],
                          ["<b>Grupo 3 PRODUÇÃO ACADÊMICO CIENTÍFICO CULTURAL...</b>", "<b>#{users.cargahoraria[21]}<b>"],
                          ["<b>3.1 Apresentação de trabalhos acadêmicos, científicos ou culturais
                            em instituições de âmbito local, regional, nacional e/ou
                            internacional</b>", "<b>#{users.cargahoraria[12]}<b>"],
                          ["<b>3.2 Publicação em periódicos</b>", "<b>#{users.cargahoraria[13]}<b>"],
                          ["<b>3.3 Publicação em Livros</b>", "<b>#{users.cargahoraria[14]}<b>"],
                          ["<b>3.4 Participação na organização e coordenação de eventos
                            acadêmico-científico-culturais internos ou externos ao
                            IFFluminense</b>", "<b>#{users.cargahoraria[15]}<b>"],
                          ["<b>3.5 Participação no desenvolvimento de projetos de pesquisa, por
                            semestre letivo</b>", "<b>#{users.cargahoraria[16]}<b>"],
                          ["<b>3.6 Participação em Grupo de Estudo Temático soborientação de
                            professor, por semestre letivo, na área de formação e/ou em
                            áreas afins à formação</b>", "<b>#{users.cargahoraria[17]}<b>"],
                          ["<b>3.7 Apresentação de trabalhos de pesquisa institucional em eventos
                            científicos internos ou externos</b>", "<b>#{users.cargahoraria[18]}<b>"],]

                            table(table_data,:header => true, :width => 500, :cell_style => { :inline_format => true, size: 9 })


            move_down 20
            text "Atividades cadastradas e Aprovadas", :size => 12, :style => :bold
            cont = 1

            activities.each do |activity|
              if(activity.user.nome == users.nome)
                if ((activity.status == "Deferido")||(activity.status == "Indeferido"))
                   text "\nAtividade #{cont}", :size => 11, :style => :bold
                   text "Tema da Atividade: #{activity.titulo}
                            Status da Atividade: #{activity.status}
                            Instituição: #{activity.local_realizacao_atividade}
                            Relatório da Atividade: #{activity.relatorio}
                            Orientador responsável pela avaliação: #{activity.edited_by}
                            Quantidade de horas atribuídas a atividade: #{activity.hora_computada}", :size =>10
                  case activity.grupo
                  when 0
                     text "Grupo: 1.1", :size =>10
                  when 1
                     text "Grupo: 1.2", :size =>10
                  when 2
                     text "Grupo: 1.3", :size =>10
                  when 3
                     text "Grupo: 1.4", :size =>10
                  when 4
                     text "Grupo: 1.5", :size =>10
                  when 5
                     text "Grupo: 1.6", :size =>10
                  when 6
                     text "Grupo: 1.7", :size =>10
                  when 7
                     text "Grupo: 1.8", :size =>10
                  when 8
                     text "Grupo: 2.1", :size =>10
                  when 9
                     text "Grupo: 2.2", :size =>10
                  when 10
                     text "Grupo: 2.3", :size =>10
                  when 11
                     text "Grupo: 2.4", :size =>10
                  when 12
                     text "Grupo: 3.1", :size =>10
                  when 13
                     text "Grupo: 3.2", :size =>10
                  when 14
                     text "Grupo: 3.3", :size =>10
                  when 15
                     text "Grupo: 3.4", :size =>10
                  when 16
                     text "Grupo: 3.5", :size =>10
                  when 17
                     text "Grupo: 3.6", :size =>10
                  when 18
                     text "Grupo: 3.7", :size =>10
                  end
                  cont += 1
                end
              end
            end

            if(cont == 1)
               text "Não existem atividades aprovadas", :size => 10
            end
          end
      end

    # Escreve o texto com os detalhes que o usuário entrou
    # text "#{details}", :size => 12, :align => :justify, :inline_format => true
    # Move mais 30 PDF points para baixo o cursor
    # move_down 10
    # Adiciona o nome com 12 PDF points, justify e com o formato inline (Observe que o <b></b> funciona para deixar em negrito)
    # text "Com o cliente: <b>#{name}</b> por R$#{price}", :size => 12, :align => :justify, :inline_format => true
    # Muda de font para Helvetica
     font "Helvetica"
    # Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
     text "Relatório de Atividades Cadastradas", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
    # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
     number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página ", :start_count_at => 1, :page_filter => :all, :at => [ bounds.right - 140, -20], :align => :right, :size => 8
    # Gera no nosso PDF e coloca na pasta public com o nome agreement.pdf
  end
end

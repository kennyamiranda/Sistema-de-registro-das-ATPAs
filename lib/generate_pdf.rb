require 'prawn'

module GeneratePdf
  PDF_OPTIONS = {
    # Escolhe o Page size como uma folha A4
    :page_size   => "A4",
    # Define o formato do layout como portrait (poderia ser landscape)
    :page_layout => :portrait,
    # Define a margem do documento
    :margin      => [40, 50]
  }

    def self.activity user, activities
      # Apenas uma string aleatório para termos um corpo de texto pro contrato
      # lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec elementum nulla id dignissim iaculis. Vestibulum a egestas elit, vitae feugiat velit. Vestibulum consectetur non neque sit amet tristique. Maecenas sollicitudin enim elit, in auctor ligula facilisis sit amet. Fusce imperdiet risus sed bibendum hendrerit. Sed vitae ante sit amet sapien aliquam consequat. Duis sed magna dignissim, lobortis tortor nec, suscipit velit. Nulla sit amet fringilla nisl. Integer tempor mauris vitae augue lobortis posuere. Ut quis tellus purus. Nullam dolor mauris, egestas varius ligula non, cursus faucibus orci sectetur non neque sit amet tristique. Maecenas sollicitudin enim elit, in auctor ligula facilisis sit amet. Fusce imperdiet risus sed bibendum hendrerit. Sed vitae ante sit amet sapien aliquam consequat."

      Prawn::Document.new(PDF_OPTIONS) do |pdf|
        # Define a cor do traçado
        pdf.fill_color "666666"
        pdf.image "#{Rails.root}/public/logo/ifflogo.png", :at => [-50,790], :scale => 0.5
        pdf.move_down 10

        # Cria um texto com tamanho 30 PDF Points, bold alinha no centro
        pdf.text "Relatório de Atividades
                  Cadastradas", :size => 26, :style => :bold, :align => :center

        # Move 80 PDF points para baixo o cursor
        pdf.move_down 50
        pdf.text "Dados do Aluno
                  Nome: #{user.nome}
                  Matrícula: #{user.matricula}
                  Curso: #{user.licenciatura}\n
                  Quantidade de horas cadastradas:\n", :size => 12, :style => :bold
        if(user.cargahoraria[19] >= MAXIMO[19])
          pdf.text "Grupo 1: #{MAXIMO[19]} de #{MAXIMO[19]} - Aprovado", :size => 12, :style => :bold
        else
          pdf.text "Grupo 1: #{user.cargahoraria[19]} de #{MAXIMO[19]} - Insuficiente", :size => 12, :style => :bold
        end
        if(user.cargahoraria[20] >= MAXIMO[20])
          pdf.text "Grupo 2: #{MAXIMO[20]} de #{MAXIMO[20]} - Aprovado", :size => 12, :style => :bold
        else
          pdf.text "Grupo 2: #{user.cargahoraria[20]} de #{MAXIMO[20]} - Insuficiente", :size => 12, :style => :bold
        end
        if(user.cargahoraria[21] >= MAXIMO[21])
          pdf.text "Grupo 3: #{MAXIMO[21]} de #{MAXIMO[21]} - Aprovado", :size => 12, :style => :bold
        else
          pdf.text "Grupo 3: #{user.cargahoraria[21]} de #{MAXIMO[21]} - Insuficiente", :size => 12, :style => :bold
        end
        pdf.move_down 20
        table_data = [["<b>Grupo/Subgrupo de Atividade</b>", "Horas Cadastradas"],
                      ["<b>Grupo 1 ATIVIDADES DE EXTENSÃO / DE ENSINO</b>", "<b>#{user.cargahoraria[19]}<b>"],
                      ["<b>1.1 Participação como ouvinte em Palestras, Seminários,
                        Congressos, Conferências, Simpósios, Fóruns, Encontros,
                        Mesas Redondas e similares</b>", "<b>#{user.cargahoraria[0]}<b>"],
                      ["<b>1.2 Participação no desenvolvimento de projetos de extensão sob
                        orientação de professor,na área de formação</b>", "<b>#{user.cargahoraria[1]}<b>"],
                      ["<b>1.3 Visitas orientadas a exposições, museus, teatros, patrimônio
                        artístico ou cultural </b>", "<b>#{user.cargahoraria[2]}<b>"],
                      ["<b>1.4 Representação em Órgãos Colegiados e/ou Comissões do
                        IFFluminense campus Campos Centro</b>", "<b>#{user.cargahoraria[3]}<b>"],
                      ["<b>1.5 Participação em atividade de extensão, na área de formação, nas
                        modalidades presencial e/ou semipresencial</b>", "<b>#{user.cargahoraria[4]}<b>"],
                      ["<b>1.6 Atuação em função de bolsista no IFFluminense, em no mínimo
                        02 (dois) períodos letivos</b>", "<b>#{user.cargahoraria[5]}<b>"],
                      ["<b>1.7 Participação em curso de extensão, na área de formação, na
                        modalidade online </b>", "<b>#{user.cargahoraria[6]}<b>"],
                      ["<b>1.8 Participação em Atividade de Monitoria, na área de formação,
                        no 2.º segmento do Ensino Fundamental, em Cursos de Nível
                        Médio e/ou em Curso Superior</b>", "<b>#{user.cargahoraria[7]}<b>"],
                      ["<b>Grupo 2 ATIVIDADES ACADÊMICO CIENTÍFICO CULTURAIS", "<b>#{user.cargahoraria[20]}<b>"],
                      ["<b>2.1 Participação como ouvinte na apresentação oral de Defesa do
                        Projeto de Qualificação de Trabalho de Conclusão Dissertação
                        e Tese), na área de formação e/ou em áreas afins à formação</b>", "<b>#{user.cargahoraria[8]}<b>"],
                      ["<b>2.2 Participação como ouvinte na apresentação oral de Monografias
                        (Trabalho Conclusão de Curso, Dissertação e Tese), na área de
                        formação e/ou em áreas afins à formação</b>", "<b>#{user.cargahoraria[9]}<b>"],
                      ["<b>2.3 Participação como ouvinte em Palestras, Seminários,Congressos,
                        Conferências, Simpósios, Fóruns, Encontros, Mesas Redondas,
                        minicursos, oficinas e similares</b>", "<b>#{user.cargahoraria[10]}<b>"],
                      ["<b>2.4 Participação como ouvinte em atividades artísticas e culturais
                        sob a supervisão de professor e/ou de profissional do
                        IFFluminense</b>", "<b>#{user.cargahoraria[11]}<b>"],
                      ["<b>Grupo 3 PRODUÇÃO ACADÊMICO CIENTÍFICO CULTURAL...</b>", "<b>#{user.cargahoraria[21]}<b>"],
                      ["<b>3.1 Apresentação de trabalhos acadêmicos, científicos ou culturais
                        em instituições de âmbito local, regional, nacional e/ou
                        internacional</b>", "<b>#{user.cargahoraria[12]}<b>"],
                      ["<b>3.2 Publicação em periódicos</b>", "<b>#{user.cargahoraria[13]}<b>"],
                      ["<b>3.3 Publicação em Livros</b>", "<b>#{user.cargahoraria[14]}<b>"],
                      ["<b>3.4 Participação na organização e coordenação de eventos
                        acadêmico-científico-culturais internos ou externos ao
                        IFFluminense</b>", "<b>#{user.cargahoraria[15]}<b>"],
                      ["<b>3.5 Participação no desenvolvimento de projetos de pesquisa, por
                        semestre letivo</b>", "<b>#{user.cargahoraria[16]}<b>"],
                      ["<b>3.6 Participação em Grupo de Estudo Temático soborientação de
                        professor, por semestre letivo, na área de formação e/ou em
                        áreas afins à formação</b>", "<b>#{user.cargahoraria[17]}<b>"],
                      ["<b>3.7 Apresentação de trabalhos de pesquisa institucional em eventos
                        científicos internos ou externos</b>", "<b>#{user.cargahoraria[18]}<b>"],]

        pdf.table(table_data,:header => true, :width => 500, :cell_style => { :inline_format => true, size: 9 })

        pdf.move_down 20
        pdf.text "Atividades cadastradas e Aprovadas", :size => 12, :style => :bold
        cont = 1
        activities.each do |activity|
          if ((activity.status == "Deferido")||(activity.status == "Indeferido"))
            pdf.text "\nAtividade #{cont}", :size => 11, :style => :bold
            pdf.text "Tema da Atividade: #{activity.titulo}
                      Status da Atividade: #{activity.status}
                      Instituição: #{activity.local_realizacao_atividade}
                      Relatório da Atividade: #{activity.relatorio}
                      Orientador responsável pela avaliação: #{activity.edited_by}
                      Quantidade de horas atribuídas a atividade: #{activity.hora_computada}", :size =>10
            case activity.grupo
            when 0
              pdf.text "Grupo: 1.1", :size =>10
            when 1
              pdf.text "Grupo: 1.2", :size =>10
            when 2
              pdf.text "Grupo: 1.3", :size =>10
            when 3
              pdf.text "Grupo: 1.4", :size =>10
            when 4
              pdf.text "Grupo: 1.5", :size =>10
            when 5
              pdf.text "Grupo: 1.6", :size =>10
            when 6
              pdf.text "Grupo: 1.7", :size =>10
            when 7
              pdf.text "Grupo: 1.8", :size =>10
            when 8
              pdf.text "Grupo: 2.1", :size =>10
            when 9
              pdf.text "Grupo: 2.2", :size =>10
            when 10
              pdf.text "Grupo: 2.3", :size =>10
            when 11
              pdf.text "Grupo: 2.4", :size =>10
            when 12
              pdf.text "Grupo: 3.1", :size =>10
            when 13
              pdf.text "Grupo: 3.2", :size =>10
            when 14
              pdf.text "Grupo: 3.3", :size =>10
            when 15
              pdf.text "Grupo: 3.4", :size =>10
            when 16
              pdf.text "Grupo: 3.5", :size =>10
            when 17
              pdf.text "Grupo: 3.6", :size =>10
            when 18
              pdf.text "Grupo: 3.7", :size =>10
            end
          cont += 1
          end
        end

        if(cont == 1)
          pdf.text "Não existem atividades aprovadas", :size => 10
        end

        # Escreve o texto com os detalhes que o usuário entrou
        #pdf.text "#{details}", :size => 12, :align => :justify, :inline_format => true
        # Move mais 30 PDF points para baixo o cursor
        #pdf.move_down 10
        # Adiciona o nome com 12 PDF points, justify e com o formato inline (Observe que o <b></b> funciona para deixar em negrito)
        #pdf.text "Com o cliente: <b>#{name}</b> por R$#{price}", :size => 12, :align => :justify, :inline_format => true
        # Muda de font para Helvetica
        pdf.font "Helvetica"
        # Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
        pdf.text "Relatório de Atividades Cadastradas", :size => 10, :inline_format => true, :valign => :bottom, :align => :left
        # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
        pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página ", :start_count_at => 1, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
        # Gera no nosso PDF e coloca na pasta public com o nome agreement.pdf
        return pdf
      end
    end

end

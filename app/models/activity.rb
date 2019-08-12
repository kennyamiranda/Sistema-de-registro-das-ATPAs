class Activity < ApplicationRecord
  belongs_to :user
  before_update :impedir_duplicata
  after_update :validar_hora
  after_update :deletar_anexo
  before_destroy :retirar_hora
  before_destroy :deletar_anexo
  
  mount_uploaders :documents, DocumentUploader

  validates :hora_computada, :titulo, :grupo, :data_evento,
  :local_realizacao_atividade, presence: true

  validates :nome_grupo, :nome_usuario, presence: false

  def deletar_anexo
    if((self.status == "Deferido")||(self.status == "Indeferido"))
      if (self.documents?)
        self.remove_documents!
      end
    end
  end

    user ||= User.new # guest user (not logged in)
    def validar_hora
      if(self.status == "Deferido")
        x = User.find(self.user_id)
        x.cargahoraria_total[self.grupo] += self.hora_computada
        x.cargahoraria[self.grupo] += self.hora_computada
        if(x.cargahoraria[self.grupo] > MAXIMO[self.grupo])
          x.cargahoraria[self.grupo] = MAXIMO[self.grupo]
        end
        if(self.grupo <= 7)
          x.cargahoraria_total[19] = (x.cargahoraria_total[0] + x.cargahoraria_total[1] + x.cargahoraria_total[2] + x.cargahoraria_total[3] + x.cargahoraria_total[4] + x.cargahoraria_total[5] + x.cargahoraria_total[6] + x.cargahoraria_total[7])
          x.cargahoraria[19] = (x.cargahoraria[0] + x.cargahoraria[1] + x.cargahoraria[2] + x.cargahoraria[3] + x.cargahoraria[4] + x.cargahoraria[5] + x.cargahoraria[6] + x.cargahoraria[7])
          if(x.cargahoraria[19] > MAXIMO[19])
            x.cargahoraria[19] = MAXIMO[19]
          end
        else
          if(self.grupo <= 11)
            x.cargahoraria_total[20] = (x.cargahoraria_total[8] + x.cargahoraria_total[9] + x.cargahoraria_total[10] + x.cargahoraria_total[11])
            x.cargahoraria[20] = (x.cargahoraria[8] + x.cargahoraria[9] + x.cargahoraria[10] + x.cargahoraria[11])
            if(x.cargahoraria[20] > MAXIMO[20])
              x.cargahoraria[20] = MAXIMO[20]
            end
          else
            x.cargahoraria_total[21] = (x.cargahoraria_total[12] + x.cargahoraria_total[13] + x.cargahoraria_total[14] + x.cargahoraria_total[14] + x.cargahoraria_total[16] + x.cargahoraria_total[17] + x.cargahoraria_total[18])
            x.cargahoraria[21] = (x.cargahoraria[12] + x.cargahoraria[13] + x.cargahoraria[14] + x.cargahoraria[15] + x.cargahoraria[16] + x.cargahoraria[17] + x.cargahoraria[18])
            if(x.cargahoraria[21] > MAXIMO[21])
              x.cargahoraria[21] = MAXIMO[21]
            end
          end
        end
        x.save!
      end
    end

    def retirar_hora
      if(self.status == "Deferido")
        x = User.find(self.user_id)
        x.cargahoraria_total[self.grupo] -= self.hora_computada
        if(x.cargahoraria_total[self.grupo] < MAXIMO[self.grupo])
          x.cargahoraria[self.grupo] = x.cargahoraria_total[self.grupo]
        end
        if(self.grupo <= 7)
          x.cargahoraria_total[19] = (x.cargahoraria_total[0] + x.cargahoraria_total[1] + x.cargahoraria_total[2] + x.cargahoraria_total[3] + x.cargahoraria_total[4] + x.cargahoraria_total[5] + x.cargahoraria_total[6] + x.cargahoraria_total[7])
          x.cargahoraria[19] = (x.cargahoraria[0] + x.cargahoraria[1] + x.cargahoraria[2] + x.cargahoraria[3] + x.cargahoraria[4] + x.cargahoraria[5] + x.cargahoraria[6] + x.cargahoraria[7])
          if(x.cargahoraria[19] > MAXIMO[19])
            x.cargahoraria[19] = MAXIMO[19]
          end
        else
          if(self.grupo <= 11)
            x.cargahoraria_total[20] = (x.cargahoraria_total[8] + x.cargahoraria_total[9] + x.cargahoraria_total[10] + x.cargahoraria_total[11])
            x.cargahoraria[20] = (x.cargahoraria[8] + x.cargahoraria[9] + x.cargahoraria[10] + x.cargahoraria[11])
            if(x.cargahoraria[20] > MAXIMO[20])
              x.cargahoraria[20] = MAXIMO[20]
            end
          else
            x.cargahoraria_total[21] = (x.cargahoraria_total[12] + x.cargahoraria_total[13] + x.cargahoraria_total[14] + x.cargahoraria_total[14] + x.cargahoraria_total[16] + x.cargahoraria_total[17] + x.cargahoraria_total[18])
            x.cargahoraria[21] = (x.cargahoraria[12] + x.cargahoraria[13] + x.cargahoraria[14] + x.cargahoraria[15] + x.cargahoraria[16] + x.cargahoraria[17] + x.cargahoraria[18])
            if(x.cargahoraria[21] > MAXIMO[21])
              x.cargahoraria[21] = MAXIMO[21]
            end
          end
        end
        x.save!
      end
    end

    def impedir_duplicata
    if(self.status_was == "Deferido")
      x = User.find(self.user_id)
      x.cargahoraria_total[self.grupo_was] -= self.hora_computada_was
      if(x.cargahoraria_total[self.grupo_was] < MAXIMO[self.grupo_was])
        x.cargahoraria[self.grupo_was] = x.cargahoraria_total[self.grupo_was]
      end
      if(self.grupo_was <= 7)
        x.cargahoraria_total[19] = (x.cargahoraria_total[0] + x.cargahoraria_total[1] + x.cargahoraria_total[2] + x.cargahoraria_total[3] + x.cargahoraria_total[4] + x.cargahoraria_total[5] + x.cargahoraria_total[6] + x.cargahoraria_total[7])
        x.cargahoraria[19] = (x.cargahoraria[0] + x.cargahoraria[1] + x.cargahoraria[2] + x.cargahoraria[3] + x.cargahoraria[4] + x.cargahoraria[5] + x.cargahoraria[6] + x.cargahoraria[7])
        if(x.cargahoraria[19] > MAXIMO[19])
          x.cargahoraria[19] = MAXIMO[19]
        end
      else
        if(self.grupo_was <= 11)
          x.cargahoraria_total[20] = (x.cargahoraria_total[8] + x.cargahoraria_total[9] + x.cargahoraria_total[10] + x.cargahoraria_total[11])
          x.cargahoraria[20] = (x.cargahoraria[8] + x.cargahoraria[9] + x.cargahoraria[10] + x.cargahoraria[11])
          if(x.cargahoraria[20] > MAXIMO[20])
            x.cargahoraria[20] = MAXIMO[20]
          end
        else
          x.cargahoraria_total[21] = (x.cargahoraria_total[12] + x.cargahoraria_total[13] + x.cargahoraria_total[14] + x.cargahoraria_total[14] + x.cargahoraria_total[16] + x.cargahoraria_total[17] + x.cargahoraria_total[18])
          x.cargahoraria[21] = (x.cargahoraria[12] + x.cargahoraria[13] + x.cargahoraria[14] + x.cargahoraria[15] + x.cargahoraria[16] + x.cargahoraria[17] + x.cargahoraria[18])
          if(x.cargahoraria[21] > MAXIMO[21])
            x.cargahoraria[21] = MAXIMO[21]
          end
        end
      end
      x.save!
    end
  end
end

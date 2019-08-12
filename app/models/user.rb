class User < ApplicationRecord
  # Atributos de validação do usuário
  validates :nome, :matricula, :licenciatura, :inicio_ano,
  :termino_ano, presence: true

  # Atributo para upload de fotos
  mount_uploader :avatar, AvatarUploader

  # Atributo para validação da role administrativa e de normal_user
  enum role: [:normal_user, :admin]


  validates_integrity_of  :avatar
  validates_processing_of :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :activities

  serialize :cargahoraria, Array
  serialize :cargahoraria_total, Array

  before_create :default_values

  def default_values
  	self.cargahoraria = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    self.cargahoraria_total = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  end

end

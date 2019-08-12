class Evento < ApplicationRecord
  validates :noticia, presence: false

  mount_uploader :noticia_foto, NoticiaUploader

  validates_integrity_of  :noticia_foto
  validates_processing_of :noticia_foto
end

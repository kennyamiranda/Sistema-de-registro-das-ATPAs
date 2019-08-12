class Duvida < ApplicationRecord
  validates :duvida, :resposta, presence: false
end

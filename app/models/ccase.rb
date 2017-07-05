class Ccase < ApplicationRecord

  validates :title, :description, :device, :custphone, presence: true



end

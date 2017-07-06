class Ccase < ApplicationRecord

  validates :title, :description, :device, :custphone, presence: true


  belongs_to :user

  has_many :posts





end

class Country < ApplicationRecord

  #############################################################################
  # Data  model relationships
  #############################################################################
  has_many :categories


  #############################################################################
  # Controls on set data`
  #############################################################################
  validates :code,
            presence: true,
            uniqueness: true

  validates :label,
            presence: true,
            length: {maximum: 50}

end

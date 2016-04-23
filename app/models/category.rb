class Category < ApplicationRecord

  #############################################################################
  # Data  model relationships
  #############################################################################
  belongs_to :country




  #############################################################################
  # Controls on set data`
  #############################################################################
  validates :code,
            presence:true,
            uniqueness: true,
            length: 3

  validates :label,
            presence:true,
            length: {maximum: 50}


end

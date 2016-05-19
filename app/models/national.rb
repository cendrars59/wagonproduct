class National < ApplicationRecord
  #############################################################################
  # Data  model relationships
  #############################################################################
  
  belongs_to :retailer
  has_many :regionals

  #############################################################################
  # Controls on set data`
  #############################################################################
  
  validates :code,
            presence:true,
            uniqueness: true

  validates :label,
            presence:true,
            length: {maximum: 50}

  
  #############################################################################
  # Scope on set data`
  #############################################################################

  # Scope on the active nationals
  scope :active, -> {
    where(:active => true)
  }

  scope :search, -> (query){
    where("code like :query or label like :query", query: "%#{query}%")
  }
  
end

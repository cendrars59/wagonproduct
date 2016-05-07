class Country < ApplicationRecord

  #############################################################################
  # Data  model relationships
  #############################################################################

  # Allowing the attachement of a photo to a category
  has_attachment :photo

  # Relathionship with a master country
  belongs_to :country
  has_many :countries

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

  #############################################################################
  # Scope on set data`
  #############################################################################

    # Scope on the active countries
  scope :active, -> {
    where(:active => true)
  }

  scope :master, -> {
    where("active = ? and master = ?", true,true )
  }
end

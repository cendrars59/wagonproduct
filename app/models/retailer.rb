class Retailer < ApplicationRecord
  #############################################################################
  # Data  model relationships
  #############################################################################
  has_attachment :photo

  belongs_to :country

  #############################################################################
  # Controls before data records`
  #
  #############################################################################
  validates :code,
            presence: true,
            uniqueness: true,
            length: {maximum: 3}

  validates :label,
            presence: true,
            length: {maximum: 40}


  validates :country_id,
            presence:true

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

  scope :notMasterAndActive, -> {
    where("active = ? and master = ?", true,false)
  }

end

class Country < ApplicationRecord

  #############################################################################
  # Data  model relationships
  #############################################################################
  has_attachment :photo

  belongs_to :country
  has_many :countries


  has_many :categories
  has_many :retailers

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


  validates_associated :countries

  #############################################################################
  # Data mangement `
  #
  #############################################################################

  before_create :set_code



  #############################################################################
  # Scope on set data`
  #############################################################################

  # Scope on the active countries
  scope :active, -> {
    where("active = ?", true)
  }

  scope :master, -> {
    where("master = ?",true)
  }

  scope :search, -> (query){
    where("code like :query or label like :query", query: "%#{query}%")
  }


  scope :notMasterAndActive, -> {
    where("active = ? and master = ?", true, false)
  }

  private

  def set_code
    self.code = self.label.strip.upcase[0..2]
  end


end

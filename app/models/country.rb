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
  # Data mangement before validation `
  #
  #############################################################################

  # Rq-country-003 : Before creating or updating country Info set label in the 
  # right format : not space before / first letter capitalize
  before_validation :format_label


  # Rq-country-001 : Before creating or updating country Info generate the code 
  # according the label set.
  before_validation :set_code


  #############################################################################
  # Controls before data records`
  #
  #############################################################################
  validates :code,
            presence: true,
            uniqueness: true,
            length: {maximum: 10}

  validates :label,
            presence: true,
            length: {maximum: 50}

  validates :country,
            presence: true,if: :if_not_master_country?
            

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

  scope :ordered, -> {
    order(master: :desc,active: :desc,code: :desc)
  }
  

  private

  # Rq-country-002 : The code is built from 3 first caracters of the country label and set in Upcase 
  # No space before and after 
  def set_code
    self.code = self.label.strip.upcase[0..2]
  end

  def format_label
    self.label = self.label.strip.capitalize
  end 

  def if_not_master_country?
      self.master == false or self.master == nil 
  end


end

class Category < ApplicationRecord

  #############################################################################
  # Data  model relationships
  #############################################################################

  # Allowing the attachement of a photo to a category
  has_attachment :photo

  belongs_to :category
  has_many :categories

  belongs_to :country
  has_many :users
  has_many :markets

  #############################################################################
  # Data mangement before validation `
  #
  #############################################################################

  # Rq-category-003 : Before creating or updating country Info set label in the 
  # right format : not space before / first letter capitalize
  before_validation :format_label


  # Rq-category-001 : Before creating or updating country Info generate the code 
  # according the label set.
  before_validation :set_code


  #############################################################################
  # Controls on set data`
  #############################################################################
  validates :code,
            presence:true,
            uniqueness: true,
            length: {maximum: 10}

  validates :label,
            presence:true,
            length: {maximum: 50}

  validates :category,
             presence: true, if: :master_category_mandatory_if_not_master?

  validates :country,
             presence: true, if: :country_mandatory_if_master_category?

  
  #############################################################################
  # Scope on set data`
  #############################################################################

  # Scope on the active categories
  
  scope :ordered, -> {
    order(master: :desc, code: :desc)
  }

  scope :active, -> {
    where(:active => true)
  }

  scope :master, -> {
    where("active = ? and master = ?", true,true )
  }

  scope :notMasterAndActive, -> {
    where("active = ? and master = ?", true, nil|false)
  }

  scope :search, -> (query){
    where("code like :query or label like :query", query: "%#{query}%")
  }

  #############################################################################
  # private methods for data validation 
  #############################################################################
  
  private 

  def format_label
    self.label = self.label.strip.capitalize
  end

  # Rq-category-002 : Generating the category code
  # The category is master : country.code+"- Master"
  # The category is not master : country.code of the master category +"-"+first three caracters of the category label
  def set_code
    if (self.master == false or self.master == nil)
      self.code = self.category.country.code+"-"+self.label.strip.upcase[0..2]
    else 
      self.code = self.country.code+"-Master"
    end 
  end

  def master_category_mandatory_if_not_master?
      self.master == false or self.master == nil 
  end

  def country_mandatory_if_master_category?
      self.master == true
  end


end

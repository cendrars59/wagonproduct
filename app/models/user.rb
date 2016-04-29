class User < ApplicationRecord

  #############################################################################
  # Data  model relationships
  #############################################################################

  # Allowing the attachement of a photo to a category
  has_attachment :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

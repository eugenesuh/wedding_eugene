class User < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :dependent => :destroy

  has_many   :accomodations,
             :dependent => :destroy

  has_many   :scomments,
             :dependent => :destroy

  has_many   :slikes,
             :dependent => :destroy

  has_many   :guests,
             :dependent => :destroy

  has_many   :bookmarks,
             :class_name => "Alike",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

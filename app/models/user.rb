class User < ApplicationRecord
  # Direct associations

  has_many   :hotels,
             :dependent => :destroy

  has_many   :alikes,
             :dependent => :destroy

  has_many   :hcomments,
             :dependent => :destroy

  has_many   :pcomments,
             :dependent => :destroy

  has_many   :plikes,
             :dependent => :destroy

  has_many   :activities,
             :dependent => :destroy

  has_many   :songs,
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  has_many   :scomments,
             :dependent => :destroy

  has_many   :slikes,
             :dependent => :destroy

  has_many   :guests,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

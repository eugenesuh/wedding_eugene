class Song < ApplicationRecord
  # Direct associations

  has_many   :slikes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
